
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:shiftapp/presentation/presentationUser/collect_cash/pages/collect_cash_item.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/rate/pages/rate_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/gradiant_button.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/common/domain/entities/collect_cash/cashier.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../bloc/collect_cash_cubit.dart';
import 'cashier_page.dart';

class CashierScreen
    extends BaseBlocWidget<Initialized<List<Cashier>>, CollectCashCubit> {
  final CashierPageArgs jobCash;

  CashierScreen({required this.jobCash});
  @override
  bool initializeByKoin() {
    return false;
  }
  void requestCode() {
    bloc.fetchCode(jobCash.projectId,jobCash.type);
  }

  bool isEvaluated = true;

  @override
  Widget buildWidget(BuildContext context, Initialized<List<Cashier>> state) {
    return CashierListWidget(
      cashierList: state.data,
      onRequestCode: () {
        if (isEvaluated) {
          requestCode();
        } else {
          navigateToEvaluate(context);
        }
      },
      codeStream: bloc.codeStream,
    );
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.loadInitialData(jobCash.projectId);
  }

  Future<void> navigateToEvaluate(BuildContext context) async {
    final update = await RatePage.show(context, jobCash.projectId);
    if (update is bool && update == true) {
      isEvaluated = true;
      requestCode();
    }
  }
}

class CashierListWidget extends StatefulWidget {
  final List<Cashier> cashierList;
  final Function onRequestCode;
  final Stream<CommonState> codeStream;
  const CashierListWidget(
      {Key? key,
      required this.cashierList,
      required this.codeStream,
      required this.onRequestCode})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CashierListWidget();
}

class _CashierListWidget extends State<CashierListWidget> {
  Set<Marker> _markers = Set();
  GoogleMapController? mapController;
  final strings = Get.context!.getStrings();
  @override
  Widget build(BuildContext context) {
    _markers = widget.cashierList
        .map((e) => Marker(
            markerId: MarkerId(e.id.toString()),
            position: e.getLatLng(),
            infoWindow: InfoWindow(title: e.name, snippet: e.address)))
        .toSet();

    return Stack(
      fit: StackFit.passthrough,
      children: [
        GoogleMap(
          compassEnabled: true,
          mapToolbarEnabled: true,
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          markers: _markers,
          onMapCreated: (controller) async {
            mapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: widget.cashierList.first.getLatLng(),
            zoom: 10.0,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.white, // Button color
                      child: InkWell(
                        splashColor: Colors.red, // Splash color
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.arrow_back)),
                      ),
                    ),
                  ),
                  kBuildCircleImageFromAsset('images/user.png')
                ],
              ),
              SizedBox(
                height: 24,
              ),
              buildReceiveCodeWidget(widget.codeStream),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 50,
          end: 0,
          start: 60,
          child: buildCashierListWidget(widget.cashierList),
        )
      ],
    );
  }

  Widget buildCodeSection(
      {required Function onClick, String? code, required bool inProgress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
              width: 150,
              child: GradiantButton(
                text: strings.request_code,
                child: inProgress
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: kPrimaryDark,
                        ),
                      )
                    : null,
                colors: [Colors.greenAccent, kPrimary],
                padding: EdgeInsets.all(0),
                onPressed: () {
                  if (!inProgress) {
                    onClick();
                  }
                },
              )),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 36,
            width: 180,
            padding: EdgeInsets.only(left: 12, right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 1)),
            child: Text(
              code ?? strings.code_appear_here,
              style: code != null
                  ? kTextBold.copyWith(wordSpacing: 4, letterSpacing: 4)
                  : kTextLabel,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildReceiveCodeWidget(Stream<CommonState> codeStream) {
    return SizedBox(
        child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16.0, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText(
              strings.share_code_with_cashier,
              startIcon: circleIcon(Colors.black, size: 10),
              mathWidth: true,
              startIconPadding: EdgeInsetsDirectional.only(end: 12),
              style: kTextLabel,
            ),
            MaterialText(
              strings.code_valid_on_time,
              startIcon: circleIcon(Colors.black, size: 10),
              mathWidth: true,
              startIconPadding: EdgeInsetsDirectional.only(end: 12),
              style: kTextLabel,
            ),
            MaterialText(
              strings.company_not_responsible_misuse,
              startIcon: circleIcon(Colors.black, size: 10),
              mathWidth: true,
              startIconPadding: EdgeInsetsDirectional.only(end: 12),
              style: kTextLabel,
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: StreamBuilder<CommonState>(
                  stream: widget.codeStream,
                  builder: (context, snapshot) {
                    final code =
                        snapshot.data != null && snapshot.data! is Initialized
                            ? (snapshot.data as Initialized).data.toString()
                            : null;

                    final progress =
                        snapshot.data != null && snapshot.data! is LoadingState;
                    print('StreamBuilder ${snapshot.data} => code');
                    return buildCodeSection(
                        inProgress: progress,
                        onClick: () {
                          widget.onRequestCode();
                        },
                        code: code);
                  }),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    ));
  }

  buildCashierListWidget(List<Cashier> cashierList) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
          itemCount: widget.cashierList.length,
          controller: PageController(
            viewportFraction: 0.8,
            initialPage: 0,
          ),
          onPageChanged: (index) {
            final marker = _markers.firstWhere((element) =>
                element.markerId ==
                MarkerId(widget.cashierList[index].id.toString()));
            mapController!.showMarkerInfoWindow(marker.markerId);

            mapController!.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: widget.cashierList[index].getLatLng(), zoom: 14)));
          },
          itemBuilder: (con, index) {
            final item = widget.cashierList[index];
            return SizedBox(
              height: 100,
              width: 100,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                  onTap: () {
                    final marker = _markers.firstWhere((element) =>
                        element.markerId ==
                        MarkerId(widget.cashierList[index].id.toString()));
                    mapController!.showMarkerInfoWindow(marker.markerId);

                    mapController!.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: widget.cashierList[index].getLatLng(),
                            zoom: 14)));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 16.0, top: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: kBuildCircleImageFromAsset(
                                      'images/avatar.png')),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name.toString(),
                                      style: kTextMedium,
                                    ),
                                    Text(
                                      item.address.toString(),
                                      style: kTextLabel,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 150,
                                child: CupertinoButton(
                                  child: Text(strings.navigate),
                                  onPressed: () {
                                    AppUtils.launchMap(
                                        lat: item.getLatitude().toString(),
                                        long: item.getLongitude().toString());
                                  },
                                  color: kGreen_6E,
                                  minSize: 0,
                                  padding: EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  AppUtils.launchPhone(phone: item.phone ?? '');
                                },
                                child: Container(
                                  width: 40,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: kGreen_6E, width: 1)),
                                  child: Center(
                                      child: Icon(
                                    Icons.call,
                                    color: kGreen_6E,
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
