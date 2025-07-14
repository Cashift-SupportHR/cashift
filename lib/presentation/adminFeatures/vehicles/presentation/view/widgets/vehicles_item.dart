 import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/vehicle_traking_details_prams.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/index.dart';
 import 'package:shiftapp/utils/app_icons.dart';
import '../../../../../../core/services/routes.dart';
 import '../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../common/components/bottom_sheet/bottom_sheet_options.dart';
import '../../../domain/entities/vehicle.dart';

class VehiclesItem extends BaseStatelessWidget {
  final Function() onRefresh;
  // final Function(String) onChangeStatus;
  final Function(int id) onDelete;
  Vehicle data;
  VehiclesItem({
    Key? key,
    required this.data,
    required this.onRefresh,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: Decorations.decorationTabs,
          child: Column(
            children: [
              Row(
                children: [
                  kBuildCircleImage(data.vehicleImage ?? "", size: 40),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.vehicleBrandName ?? ""} - ${data.model ?? ""}',
                          style: kTextBold.copyWith(fontSize: 16),
                        ),
                        Text(
                          data.projectName ?? "",
                          style: kTextRegular.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListRowTextsIcons(icons: [
                AppIcons.buildingsOutline,
                AppIcons.car3,
                AppIcons.car3,
                AppIcons.color,
                AppIcons.calandery,
              ], titles: [
                strings.company_name,
                strings.plate_number,
                strings.license_number,
                strings.color,
                strings.year_crate,
              ], values: [
                '${data.companyName ?? ""}',
                data.plateNumber ?? "",
                data.licenseNumber ?? "",
                data.vehicleColorName ?? "",
                data.yearOfManufacture?.toString() ?? "",

              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: detailsButton(context),
              ),
            ],
          ),
        ),

        PositionedDirectional(
          end: 10,
          top: 10,
          child: _OptionsMenuButton(
            item: data,
            onDelete: () => onDelete(data.id ?? 0),
            onRefresh: onRefresh,
          ),
        ),
      ],
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.vehiclesDetailsPage,
          arguments: data.id,
        );
      },
      child: IconText(
        icon: AppIcons.hazard_details,
        text: strings.show_details,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.only(top: 5),
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final Vehicle item;
  final Function() onDelete;
  final Function() onRefresh;
  _OptionsMenuButton({
    required this.item,
    required this.onDelete,
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetOptionsMenu(
      options: getOptionsMenu(context),
    );
  }

  List<BottomSheetOption> getOptionsMenu(BuildContext context) {
   return [
     BottomSheetOption(
       title: strings.edit_data_vehicles,
       icon: AppIcons.carEdit,
       onTap: () async {
         final isRefresh = await  Navigator.pushNamed(context, Routes.mainAddVehiclePage, arguments: item.id);
         print("isRefresh $isRefresh");
         if(isRefresh == true){
           onRefresh();
         }
       },
     ),
     BottomSheetOption(
       title: strings.vehicle_insurance,
       icon: AppIcons.car3,
       routeName: Routes.insurancePage,
       arguments: item.id,
     ),
     BottomSheetOption(
       title: strings.edit_covenant,
       icon: AppIcons.hand,
       routeName: Routes.vehiclesCovenantPage,
       arguments: item.id,
     ),
     BottomSheetOption(
       title: strings.print_qr_code,
       icon: AppIcons.qr3,
       routeName: Routes.vehicleQrCodePage,
       arguments: item.id,
     ),
     BottomSheetOption(
       title: strings.cameras,
       icon: AppIcons.camera_vehicle,
       routeName: Routes.vehicleCamerasPage,
       arguments: item,
     ),
     BottomSheetOption(
       title: strings.track_vehicle_on_map,
       icon: AppIcons.carTime,
       routeName: Routes.vehiclesTrackingPage,
       arguments: VehicleTrakingDetailsPrams(isVehicleHandover:false,vehicleHandoverId: 0,vehicleId: item.id,  ),
     ),
     BottomSheetOption(
       title: strings.delete,
       icon: AppIcons.deleteOutline,
       onTap: () {
         Navigator.pop(context);
         onDelete();
       },
     ),
   ];
  }
}
