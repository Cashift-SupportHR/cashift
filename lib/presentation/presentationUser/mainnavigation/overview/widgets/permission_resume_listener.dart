import 'package:flutter/widgets.dart';

/// PermissionResumeListener
///
/// A lifecycle helper widget that listens for app resume and invokes [onResume].
/// Useful when the user navigates to system Settings and returns to the app,
/// so you can re-check permissions and refresh UI without another tap.
///
/// Includes a debounce to ignore quick resume events (like permission dialogs).
class PermissionResumeListener extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onResume;

  const PermissionResumeListener({
    super.key,
    required this.child,
    required this.onResume,
  });

  @override
  State<PermissionResumeListener> createState() =>
      _PermissionResumeListenerState();
}

class _PermissionResumeListenerState extends State<PermissionResumeListener>
    with WidgetsBindingObserver {
  DateTime? _pausedAt;

  // Minimum time the app must be paused before we trigger onResume
  // Permission dialogs are quick (<2 seconds), but going to Settings takes longer
  static const _minPauseDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _pausedAt = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      // Only trigger if app was paused for more than the minimum duration
      // This filters out quick pause/resume cycles from permission dialogs
      if (_pausedAt != null) {
        final pauseDuration = DateTime.now().difference(_pausedAt!);
        if (pauseDuration >= _minPauseDuration) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onResume();
          });
        }
      }
      _pausedAt = null;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
