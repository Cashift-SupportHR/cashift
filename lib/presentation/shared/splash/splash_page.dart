import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../common/data/repositories/local/local_repository.dart';
import '../../../core/services/routes.dart';
import '../../adminFeatures/di/injector.dart';

class SplashScreen extends StatefulWidget {
  static void restartApp(BuildContext context) {}

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late VoidCallback listener;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/splash3.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
        addVideoEndListener();
      });
  }

  void addVideoEndListener() {
    listener = () async {
      if (_controller.value.position >= _controller.value.duration) {
        _controller.removeListener(listener);
        _controller.dispose();
        handleNavigation();
      }
    };
    _controller.addListener(listener);
  }

  void handleNavigation() {
    bool isFirstTime = checkFirstTime();
    if (!isFirstTime) {
      navigateToHome();
    } else {
      navigateToLandingPage();
    }
  }

  bool checkFirstTime() {
    try {
      return getIt<LocalRepository>().getFirstTime();
    } catch (e) {
      return true;
    }
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(
       context, Routes.home);
  }

  void navigateToLandingPage() {
    Navigator.pushReplacementNamed(
       context, Routes.landingPage);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: VideoPlayer(_controller),
      ),
    );
  }
}
