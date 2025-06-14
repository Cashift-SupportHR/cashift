import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/progress/progress_transition.dart';
import 'package:shiftapp/presentation/shared/components/progress/progress_utils.dart';

import 'base.dart';

///Typedef of Progress while on Progress Error
typedef OnProgressError(dynamic error);

///Typedef of Progress while on Progress Finish
typedef OnProgressFinish<T>(T data);

///Typedef of Progress while on Progress Cancel
typedef OnProgressCancel();

abstract class _ProgressDialog {
  ///You can set title of dialog using this function,
  ///even the dialog already pop up
  void setTitle(Widget title);

  ///You can set loading widget of dialog using this function,
  ///even the dialog already pop up.
  ///Set it Null to change it as default CircularProgressIndicator or loadingWidget that already you set before
  void setLoadingWidget(Widget loadingWidget);

  ///You can set background / barrier color of dialog using this function,
  ///even the dialog already pop up.
  ///Set it Null to change it as default
  void setBackgroundColor(Color color);

  ///You can set message of dialog using this function,
  ///even the dialog already pop up
  void setMessage(Widget message);
}

abstract class _CustomProgressDialog {
  ///You can set loading widget of dialog using this function,
  ///even the dialog already pop up.
  ///Set it Null to change it as default loadingWidget that already you set before
  void setLoadingWidget(Widget loadingWidget);

  ///You can set background / barrier color of dialog using this function,
  ///even the dialog already pop up.
  ///Set it Null to change it as default
  void setBackgroundColor(Color color);
}

///Simple progress dialog with blur background and popup animations, use DialogStyle to custom it
///inspired by ProgressDialog from Android Native, and it very simple to use
class ProgressDialog implements _ProgressDialog {
  ///The context
  final BuildContext context;

  ///Custom dialog style
  final DialogStyle? dialogStyle;

  ///The (optional) title of the progress dialog is displayed in a large font at the top of the dialog.
  final Widget? title;

  ///The (optional) message of the progress dialog is displayed in the center of the dialog in a lighter font.
  final Widget? message;

  ///The (optional) on cancel button that will display at the bottom of the dialog.
  ///Note : Do not use POP to cancel the dialog, just put your cancel code there
  final Function? onCancel;

  ///The (optional) cancel text that are displayed at the cancel button of the dialog.
  final Widget? cancelText;

  ///The (optional) default progress widget that are displayed before message of the dialog,
  ///it will replaced when you use setLoadingWidget, and it will restored if you `setLoadingWidget(null)`.
  final Widget? defaultLoadingWidget;

  ///Is your dialog dismissable, because its warp by BlurDialogBackground,
  ///you have to declare here instead on showDialog
  final bool? dismissable;

  ///Action on dialog dismissing
  final Function? onDismiss;

  ///Blur on background
  final double? blur;

  ///Dialog Barrier background color
  final Color? backgroundColor;

  ///Dialog Transition Type
  final DialogTransitionType? dialogTransitionType;

  ///Dialog Transition Duration
  final Duration? transitionDuration;

  bool _show = false;
  late _ProgressDialogWidget _progressDialogWidget;

  ProgressDialog(this.context,
      {this.dialogTransitionType,
      this.backgroundColor,
      this.cancelText,
      this.defaultLoadingWidget,
      this.blur,
      this.onCancel,
      this.dismissable,
      this.onDismiss,
      this.title,
      this.message,
      this.dialogStyle,
      this.transitionDuration}) {
    _initProgress();
  }

  @override
  void setTitle(Widget title) {
    _progressDialogWidget.getDialogState().setTitle(title);
  }

  @override
  void setLoadingWidget(Widget loadingWidget) {
    _progressDialogWidget.getDialogState().setLoadingWidget(loadingWidget);
  }

  @override
  void setBackgroundColor(Color color) {
    _progressDialogWidget.getDialogState().setBackgroundColor(color);
  }

  @override
  void setMessage(Widget message) {
    _progressDialogWidget.getDialogState().setMessage(message);
  }

  ///Show progress dialog
  void show({bool useSafeArea = true}) async {
    if (!_show) {
      _show = true;
      await DialogUtils(
        dismissable: dismissable,
        barrierColor: backgroundColor ?? Colors.black.withOpacity(.5),
        child: _progressDialogWidget,
        dialogTransitionType: dialogTransitionType,
        transitionDuration: transitionDuration,
        useSafeArea: useSafeArea,
      ).show(context);
      _show = false;
    }
  }

  ///Dissmiss progress dialog
  void dismiss() {
    if (_show) {
      _show = false;
      Navigator.pop(context);
    }
  }

  void _initProgress() {
    _progressDialogWidget = _ProgressDialogWidget(
      backgroundColor: backgroundColor,
      dialogStyle: dialogStyle ?? DialogStyle(),
      onCancel: onCancel,
      cancelText: cancelText,
      title: title,
      dismissable: dismissable,
      onDismiss: onDismiss,
      message: message,
      blur: blur ?? 0,
      loadingWidget: defaultLoadingWidget,
    );
  }

  ///future function let you show ProgressDialog until future (param)
  ///reach the end of its action
  static Future future<T>(
    BuildContext context, {
    required Future future,
    DialogStyle? dialogStyle,
    double? blur,
    Color? backgroundColor,
    OnProgressError? onProgressError,
    OnProgressFinish? onProgressFinish,
    OnProgressCancel? onProgressCancel,
    Function? onDismiss,
    bool? dismissable,
    Widget? message,
    Widget? title,
    Widget? cancelText,
    Widget? progressWidget,
    DialogTransitionType? dialogTransitionType,
    Duration? transitionDuration,
    bool useSafeArea = true,
  }) async {
    ProgressDialog pDialog = ProgressDialog(
      context,
      message: message,
      title: title,
      dismissable: dismissable,
      backgroundColor: backgroundColor,
      onDismiss: onDismiss,
      dialogStyle: dialogStyle,
      blur: blur,
      defaultLoadingWidget: progressWidget,
      cancelText: cancelText,
      onCancel: onProgressCancel != null ? onProgressCancel : null,
      dialogTransitionType: dialogTransitionType,
      transitionDuration: transitionDuration,
    );

    pDialog.show(useSafeArea: useSafeArea);

    var output;
    await future.then((data) {
      if (onProgressFinish != null) onProgressFinish = onProgressFinish!(data);
      output = data;
      pDialog.dismiss();
    }).catchError((error) {
      if (onProgressError != null) onProgressError = onProgressError!(error);
      pDialog.dismiss();
    });

    return output;
  }
}

//ignore:must_be_immutable
class _ProgressDialogWidget extends StatefulWidget {
  final DialogStyle dialogStyle;
  final Widget? title, message;
  final Widget? cancelText;
  final Function? onCancel;
  final Widget? loadingWidget;
  final Function? onDismiss;
  final bool? dismissable;
  final double? blur;
  final Color? backgroundColor;
  _ProgressDialogWidgetState _dialogWidgetState = _ProgressDialogWidgetState();

  _ProgressDialogWidget({
    Key? key,
    required this.dialogStyle,
    this.title,
    this.message,
    this.onCancel,
    this.dismissable,
    this.onDismiss,
    this.cancelText,
    this.loadingWidget,
    this.blur,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _ProgressDialogWidgetState createState() {
    _dialogWidgetState = _ProgressDialogWidgetState();
    return _dialogWidgetState;
  }

  _ProgressDialogWidgetState getDialogState() {
    _dialogWidgetState = _ProgressDialogWidgetState();
    return _dialogWidgetState;
  }
}

class _ProgressDialogWidgetState extends State<_ProgressDialogWidget>
    implements _ProgressDialog {
  Widget? _title, _message, _loading;
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DialogThemeData dialogTheme = DialogTheme.of(context);

    Widget? title = _title ?? widget.title;
    Widget? message = _message ?? widget.message;
    Color? backgroundColor = _backgroundColor ?? widget.backgroundColor;
    Widget loading = (_loading ?? widget.loadingWidget) ??
        Container(
          padding: EdgeInsets.all(10.0),
          height: 50.0,
          width: 50.0,
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        );

    EdgeInsetsGeometry? msgPadding = title == null
        ? EdgeInsets.all(15.0)
        : widget.onCancel == null
            ? widget.dialogStyle.contentPadding == null
                ? EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0)
                : widget.dialogStyle.contentPadding
            : EdgeInsets.fromLTRB(15.0, 0, 15.0, 0);

    return ArsAlertDialog(
      title: title,
      dismissable: widget.dismissable ?? true,
      blur: widget.blur,
      backgroundColor: backgroundColor,
      onDismiss: () {
        if (widget.onDismiss != null) {
          widget.onDismiss!();
        }
        if (widget.onCancel != null) widget.onCancel!();
      },
      dialogStyle: DialogStyle(
          backgroundColor: widget.dialogStyle.backgroundColor,
          titleDivider: widget.dialogStyle.titleDivider,
          borderRadius:
              widget.dialogStyle.borderRadius ?? BorderRadius.circular(2.0),
          contentPadding: msgPadding as EdgeInsets? ??
              EdgeInsets.symmetric(horizontal: 20.0),
          contentTextStyle: widget.dialogStyle.contentTextStyle,
          elevation: widget.dialogStyle.elevation,
          semanticsLabel: widget.dialogStyle.semanticsLabel,
          // animatePopup: widget.dialogStyle.animatePopup ?? true,
          shape: widget.dialogStyle.shape,
          titlePadding: widget.dialogStyle.titlePadding ??
              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
          titleTextStyle: widget.dialogStyle.titleTextStyle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loading,
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: DefaultTextStyle(
                  child: Semantics(child: message),
                  style: widget.dialogStyle.contentTextStyle ??
                      dialogTheme.contentTextStyle ??
                      theme.textTheme.titleMedium!,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: widget.onCancel == null
          ? []
          : [
              Container(
                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(.3),
                    ),
                  ),
                  onPressed: () {
                    if (widget.onCancel != null) widget.onCancel!();
                    Navigator.pop(context);
                  },
                  child: DefaultTextStyle(
                    child: widget.cancelText ?? Text("Cancel"),
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              )
            ],
    );
  }

  @override
  void setTitle(Widget title) async {
    this._title = title;
    if (mounted) setState(() {});
  }

  @override
  void setMessage(Widget message) async {
    this._message = message;
    if (mounted) setState(() {});
  }

  @override
  void setLoadingWidget(Widget loading) async {
    this._loading = loading;
    if (mounted) setState(() {});
  }

  @override
  void setBackgroundColor(Color color) async {
    this._backgroundColor = color;
    if (mounted) setState(() {});
  }
}

class CustomProgressDialog implements _CustomProgressDialog {
  ///The context
  final BuildContext context;

  ///Show as the progress, nullable to aplied to default loading widget
  final Widget? loadingWidget;

  ///The (optional) on cancel button that will display at the bottom of the dialog.
  ///Note : Do not use POP to cancel the dialog, just put your cancel code there
  final Function? onCancel;

  ///Is your dialog dismissable, because its warp by BlurDialogBackground,
  ///you have to declare here instead on showDialog
  final bool? dismissable;

  ///Action on dialog dismissing
  final Function? onDismiss;

  final double? blur;

  final Color? backgroundColor;
  final DialogTransitionType? dialogTransitionType;
  final Duration? transitionDuration;

  bool _show = false;
  late _CustomProgressDialogWidget _progressDialogWidget;

  CustomProgressDialog(
    this.context, {
    this.backgroundColor,
    this.blur,
    this.onCancel,
    this.dismissable,
    this.onDismiss,
    this.loadingWidget,
    this.dialogTransitionType,
    this.transitionDuration,
  }) {
    _initProgress();
  }

  @override
  void setLoadingWidget(Widget loadingWidget) {
    _progressDialogWidget.getDialogState().setLoadingWidget(loadingWidget);
  }

  @override
  void setBackgroundColor(Color color) {
    _progressDialogWidget.getDialogState().setBackgroundColor(color);
  }

  ///Show progress dialog
  void show({bool useSafeArea = true}) async {
    if (!_show) {
      _show = true;
      await DialogUtils(
        dismissable: dismissable,
        barrierColor: backgroundColor,
        child: _progressDialogWidget,
        dialogTransitionType: dialogTransitionType,
        transitionDuration: transitionDuration,
        useSafeArea: useSafeArea,
      ).show(context);
      _show = false;
    }
  }

  ///Dismiss the dialog
  void dismiss() {
    print(_show);
    if (_show) {
      _show = false;
      Navigator.pop(context);
    }
  }

  void _initProgress() {
    _progressDialogWidget = _CustomProgressDialogWidget(
      blur: blur,
      onCancel: onCancel,
      dismissable: dismissable,
      backgroundColor: backgroundColor,
      onDismiss: onDismiss,
      loadingWidget: loadingWidget,
    );
  }

  ///future function let you show ProgressDialog until future (param)
  ///reach the end of its action
  static Future future<T>(
    BuildContext context, {
    required Future future,
    OnProgressError? onProgressError,
    OnProgressFinish? onProgressFinish,
    OnProgressCancel? onProgressCancel,
    Color? backgroundColor,
    double? blur,
    Function? onDismiss,
    bool? dismissable,
    Widget? loadingWidget,
    DialogTransitionType? dialogTransitionType,
    Duration? transitionDuration,
    bool useSafeArea = true,
  }) async {
    CustomProgressDialog pDialog = CustomProgressDialog(
      context,
      loadingWidget: loadingWidget,
      dismissable: dismissable,
      backgroundColor: backgroundColor,
      blur: blur,
      onDismiss: onDismiss,
      onCancel: onProgressCancel != null ? onProgressCancel : null,
      dialogTransitionType: dialogTransitionType,
      transitionDuration: transitionDuration,
    );

    pDialog.show(useSafeArea: useSafeArea);

    var output;
    try {
      await future.then((data) {
        if (onProgressFinish != null)
          onProgressFinish = onProgressFinish!(data);
        output = data;
      }).catchError((error) {
        if (onProgressError != null) onProgressError = onProgressError!(error);
      });
    } catch (e) {}
    pDialog.dismiss();

    return output;
  }
}

//ignore:must_be_immutable
class _CustomProgressDialogWidget extends StatefulWidget {
  final Function? onCancel;
  final Widget? loadingWidget;
  final Function? onDismiss;
  final double? blur;
  final Color? backgroundColor;
  final bool? dismissable;
  _CustomProgressDialogWidgetState _dialogWidgetState =
      _CustomProgressDialogWidgetState();

  _CustomProgressDialogWidget({
    Key? key,
    this.onCancel,
    this.dismissable,
    this.onDismiss,
    this.backgroundColor,
    this.loadingWidget,
    this.blur,
  }) : super(key: key);

  @override
  _CustomProgressDialogWidgetState createState() {
    _dialogWidgetState = _CustomProgressDialogWidgetState();
    return _dialogWidgetState;
  }

  _CustomProgressDialogWidgetState getDialogState() {
    _dialogWidgetState = _CustomProgressDialogWidgetState();
    return _dialogWidgetState;
  }
}

class _CustomProgressDialogWidgetState
    extends State<_CustomProgressDialogWidget>
    implements _CustomProgressDialog {
  Widget? _loadingWidget;
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _backgroundColor ??
        (widget.backgroundColor ?? Colors.black.withOpacity(.5));
    Widget loadingWidget = (this._loadingWidget ?? widget.loadingWidget) ??
        Container(
          padding: EdgeInsets.all(10.0),
          height: 100.0,
          width: 100.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: CircularProgressIndicator(),
        );

    return ProgressDialogBackground(
      blur: widget.blur ?? 0,
      dismissable: widget.dismissable ?? true,
      onDismiss: widget.onDismiss,
      barrierColor: backgroundColor,
      dialog: Padding(
        padding: MediaQuery.of(context).viewInsets +
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Center(
          child: loadingWidget,
        ),
      ),
    );
  }

  @override
  void setLoadingWidget(Widget loadingWidget) async {
    this._loadingWidget = loadingWidget;
    if (mounted) setState(() {});
  }

  @override
  void setBackgroundColor(Color color) async {
    this._backgroundColor = color;
    if (mounted) setState(() {});
  }
}
