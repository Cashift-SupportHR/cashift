import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/outlint_button.dart';
import '../../../../core/services/permission_detector.dart';
import '../../../../common/components/dialogs_manager.dart';
import '../../../../common/components/error_handler_widget.dart';
import '../../../../common/components/helper_widgets.dart';
import 'camera_view.dart';

class QrCode {
  final String code;
  File? image;
  bool allowFile;

  QrCode(this.code, this.image, {this.allowFile = false});
}

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'QrCode',
      body: QRViewExample(),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  //Barcode? result;
  QRViewController? controllerQr;
  bool isPaused = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isInitialized = false;

  @override
  void reassemble() {
    super.reassemble();
    print('QRSCREEN reassemble');
    if (Platform.isAndroid) {
      controllerQr!.pauseCamera();
    }
    controllerQr!.resumeCamera();
  }

  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      print("Camera permission granted");
    } else {
      print("Camera permission denied");
    }
  }

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      print('Camera permission granted');
    } else {
      print('Camera permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.getStrings();

    return Scaffold(
      body:  Column(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: FutureBuilder<bool>(
                    initialData: false,
                    future: PermissionDetector.detectCameraAndStoragePermission(
                        context),
                    builder: (context, snapshot) {
                      return scanData == null
                          ? qrBuilder(snapshot)
                          : buildCameraView();
                    })),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(strings.scan_code),
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: FutureBuilder(
                        future: controllerQr?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Container(
                              height: 43,
                              width: 43,
                              child: AppOutlineButton(
                                  onClick: () async {
                                    await controllerQr?.toggleFlash();
                                    setState(() {});
                                  },
                                  strokeColor: snapshot.data == true
                                      ? kPrimary
                                      : kGreyishBrown,
                                  borderWidth: 0.8,
                                  radius: 10,
                                  child: Image.asset(snapshot.data == true
                                      ? 'images/flash.png'
                                      : 'images/no_flash.png')));
                          return CupertinoSwitch(
                            value: snapshot.data == true,
                            onChanged: (value) {
                              setState(() async {
                                await controllerQr?.toggleFlash();
                                setState(() {});
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: AppCupertinoButton(
                            onPressed: () async {
                              await controllerQr?.flipCamera();
                              setState(() {});
                            },
                            radius: BorderRadius.circular(16),
                            child: FutureBuilder(
                              future: controllerQr?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      snapshot.data == CameraFacing.front
                                          ? strings.front_camera
                                          : strings.back_camera,
                                  style: kTextMedium.copyWith(color: kWhite),
                                  );
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          await controllerQr?.pauseCamera();
                        },
                        child:
                            Text(strings.pause, style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 20,
                      color: kPrimary,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          await controllerQr?.resumeCamera();
                        },
                        child: Text(strings.resume_qr,
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  var showin = false;
  Barcode? scanData;
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controllerQr = controller;
      controller.resumeCamera();
    });
    controller.scannedDataStream.listen((scanData) async {
      this.scanData = scanData;
      try {
        controller.pauseCamera();
        controller.stopCamera();

        QrCode? qrCode = MyModalRoute.of(context)?.settings.arguments as QrCode?;
        if (qrCode != null && qrCode.allowFile == true) {
          setState(() {});
        } else {
          _captureImage(scanData,null);
        }
      } catch (e) {
        print('qrscreen scanned error ${e}');
      }
    });
  }

  var shown = false ;
  Future<void> _captureImage(Barcode scanData, File ?file)  async {
    if(showin){
      return ;
    }
    showin = true;
    DialogsManager.showMessageDialog(
        context, context.getStrings().qr_code_scanned, onClickOk: () async {
      try {
        controllerQr?.dispose();

        Navigator.pop(
            context,
            QrCode(
              scanData.code.toString(),
              file,
            ));

        if (kDebugMode&&file!=null) {
          showAppDialog(
            context,
            child: Container(
              height: 300,
              width: 300,
              child: Image.file(
                file,
              ),
            ),
            width: 400,
            height: 400,
          );
        }
      } catch (e) {
        print("Error capturing image: $e");
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      // Navigator.pop(context);
      // DialogsManager.showConfirmationAnimatedDialog(context,
      //     message: context.getStrings().denied_camera_permission,
      //     buttonName: context.getStrings().open_app_settings,
      //     dismissible: false,
      //     onConfirm: () {
      //   Geolocator.openAppSettings();
      // });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('no Permission')),
      // );

/*      loggerRepository.sendLog(LoggerParams(
          error: 'denied_camera_permission',
          tagName: 'PermissionSet',
          description: 'Error occurred while granting camera permission'));*/
    }
  }

  @override
  void dispose() {
    controllerQr?.dispose();
    print('QRSCREEN dispose');

    super.dispose();
  }

  buildCameraView() {
    return CameraView(
      onGetFile: (File file) {
          _captureImage(scanData!, file);

      },
    );
  }

  Widget qrBuilder(AsyncSnapshot<bool> snapshot) {
    final strings = context.getStrings();

    if (snapshot.requireData == true) {
      return _buildQrView(context);
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ErrorPlaceHolderWidget(
          title: strings.please_select_permission,
          error: strings.denied_camera_permission,
          buttonName: strings.open_app_settings,
          onClickReload: () async {
            await PermissionDetector.detectCameraAndStoragePermission(context);
            // setState(() {});
          },
        ),
      );
    }
  }
}
