import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../../../presentation/presentationUser/common/stream_data_state.dart';

class HLSPlayerWidget extends StatefulWidget {
  final String url;
  final StreamDataStateInitial<String>? streamNextVideoUrl;
  final Function()? onTenSecondsRemaining;
  final bool isLive;
  final bool isFullScreen;
  final Duration initialPosition;

  HLSPlayerWidget({
    Key? key,
    required this.url,
    this.streamNextVideoUrl,
    this.onTenSecondsRemaining,
    required this.isLive,
    this.isFullScreen = false,
    this.initialPosition = Duration.zero,
  }) : super(key: key);

  @override
  State<HLSPlayerWidget> createState() => _HLSPlayerWidgetState();
}

class _HLSPlayerWidgetState extends State<HLSPlayerWidget> {
  late VideoPlayerController _currentVideoController;
  ChewieController? _currentChewie;
  String _currentVideoUrl = '';

  VideoPlayerController? _nextVideoController;
  ChewieController? _nextChewie;
  bool _isNextPreloaded = false;

  bool _hasTenSecCallback = false;
  bool _hasFinished = false;
  bool _isRetrying = false;

  StreamSubscription? _eventSub;
  String nextVideo = '';

  @override
  void initState() {
    super.initState();
    _currentVideoUrl = widget.url;
    _listenForNextUrl();
    _initializePlayer(_currentVideoUrl, isCurrent: true);
  }

  void _listenForNextUrl() {
    if (widget.streamNextVideoUrl != null) {
      widget.streamNextVideoUrl!.stream.listen((state) {
        if (state.data != null && state.data!.isNotEmpty) {
          nextVideo = state.data!;
          _isNextPreloaded = false;
        }
      });
    }
  }

  Future<void> _initializePlayer(String url, {required bool isCurrent}) async {
    try {
      final vp = VideoPlayerController.networkUrl(Uri.parse(url));
      await vp.initialize();

      if (isCurrent) {
        if (widget.initialPosition > Duration.zero) {
          await vp.seekTo(widget.initialPosition);
        }
        await _eventSub?.cancel();
          _eventSub = EventChannel('flutter.io/videoPlayer/videoEvents${vp.playerId}')
            .receiveBroadcastStream()
            .listen(_handleVideoEvent);
      }

      final cw = ChewieController(
        videoPlayerController: vp,
        autoPlay: isCurrent,
        looping: false,
        allowMuting: true,
        allowFullScreen: false,
        allowPlaybackSpeedChanging: false,
        showOptions: false,
        isLive: widget.isLive,
        placeholder: SizedBox.shrink(),
        bufferingBuilder: (BuildContext context) => const Center(
          child: SizedBox.shrink(),
        ),
      );

      setState(() {
        if (isCurrent) {
          _currentVideoController = vp..addListener(_onPlayerUpdated);
          _currentChewie = cw;
          _hasFinished = false;
          _hasTenSecCallback = false;
        } else {
          _nextVideoController = vp;
          _nextChewie = cw;
          _isNextPreloaded = true;
        }
      });
    } catch (_) {
      widget.onTenSecondsRemaining?.call();
    }
  }

  void _handleVideoEvent(dynamic rawEvent) {
    final Map<dynamic, dynamic> event = rawEvent;
    if (event['event'] == 'error') _retryCurrentVideo();
  }

  void _onPlayerUpdated() {
    final val = _currentVideoController.value;
    if (!val.isInitialized) return;

    final remaining = val.duration - val.position;

    if (!_hasTenSecCallback && remaining <= const Duration(seconds: 10)) {
      _hasTenSecCallback = true;
      widget.onTenSecondsRemaining?.call();
      if (!_isNextPreloaded && nextVideo.isNotEmpty) {
        _initializePlayer(nextVideo, isCurrent: false);
      }
    }

    if (!_hasFinished && val.position >= val.duration) {
      _hasFinished = true;
      _swapToNext();
    }
  }

  Future<void> _retryCurrentVideo() async {
    if (_isRetrying) return;
    _isRetrying = true;
    _currentVideoController
      ..removeListener(_onPlayerUpdated)
      ..dispose();
    _currentChewie?.dispose();
    await Future.delayed(const Duration(seconds: 1));
    await _initializePlayer(_currentVideoUrl, isCurrent: true);
    _isRetrying = false;
  }

  void _swapToNext() {
    _currentVideoController
      ..removeListener(_onPlayerUpdated)
      ..pause();
    _currentChewie?.dispose();

    if (_isNextPreloaded && _nextVideoController != null) {
      setState(() {
        _currentVideoController = _nextVideoController!;
        _currentChewie = _nextChewie!;
        _nextVideoController = null;
        _nextChewie = null;
        _isNextPreloaded = false;
        _hasFinished = false;
        _hasTenSecCallback = false;
        _currentVideoUrl = nextVideo;
      });
      _currentVideoController
        ..addListener(_onPlayerUpdated)
        ..play();
    } else if (nextVideo.isNotEmpty) {
      _initializePlayer(nextVideo, isCurrent: true);
    } else {
      _hasTenSecCallback = false;
      widget.onTenSecondsRemaining?.call();
    }
  }

  @override
  void dispose() {
    _eventSub?.cancel();
    _currentChewie?.dispose();
    _currentVideoController
      ..removeListener(_onPlayerUpdated)
      ..dispose();
    _nextChewie?.dispose();
    _nextVideoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _currentChewie != null && _currentVideoController.value.isInitialized
        ? Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: widget.isFullScreen ? double.infinity : 500,
          height: widget.isFullScreen ? double.infinity : 500,
          child: Chewie(controller: _currentChewie!),
        ),
        if (!widget.isFullScreen)
          Positioned(
            right: 16,
            bottom: 16,
            child: IconButton(
              icon: const Icon(Icons.fullscreen, color: Colors.white),
              onPressed: () async {
                final currentPos = _currentVideoController.value.position;
                await _currentVideoController.pause();
                final returnedPos = await Navigator.of(context).push<Duration>(
                  MaterialPageRoute(
                    builder: (_) => HLSPlayerWidget(
                      url: _currentVideoUrl,
                      streamNextVideoUrl: widget.streamNextVideoUrl,
                      onTenSecondsRemaining: widget.onTenSecondsRemaining,
                      isLive: widget.isLive,
                      isFullScreen: true,
                      initialPosition: currentPos,
                    ),
                  ),
                );
                final resumePos = returnedPos ?? currentPos;
                await _currentVideoController.seekTo(resumePos);
                await _currentVideoController.play();
              },
            ),
          ),
      ],
    )
        : const Center(child: CircularProgressIndicator());

    if (widget.isFullScreen) {
      return WillPopScope(
        onWillPop: () async {
          final pos = _currentVideoController.value.position;
          Navigator.of(context).pop(pos);
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: content,
        ),
      );
    }

    return Scaffold(
      body: content,
    );
  }
}
