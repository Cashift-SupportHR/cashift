import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/showImagesWidget.dart';

import '../../../../../../../../core/services/routes.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';
import '../../../../../domain/entities/vehicle_component_handover.dart';
import 'customExpansionTile.dart';

class VehicleComponentsOrCovenantWidget extends BaseStatelessWidget {
  final String title;
  final String icon;
  final StreamStateInitial<int?> countStream;

  final List<VehicleComponentHandover> vehiclesComponentsHandovers;

  VehicleComponentsOrCovenantWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.countStream,
    required this.vehiclesComponentsHandovers,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: title,
      icon: icon,

      countStream: countStream,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            vehiclesComponentsHandovers.map((e) {
              print(e.componentStatusName);
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Icon(Icons.circle, color: kGray_1D, size: 8),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.vehicleComponentName ?? "",
                            style: kTextRegular.copyWith(
                              color: kGray_1D,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            e.componentStatusName ?? "",
                            style: kTextBold.copyWith(
                              color:
                                  (e.componentStatus ?? false)
                                      ? kRed_00
                                      : kRed_07,
                              fontSize: 14,
                            ),
                          ),
                          if (e.componentStatus ?? false)
                            componentStatusTrue(context, e),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }

  TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

  InkWell componentStatusTrue(
    BuildContext context,
    VehicleComponentHandover e,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: [e.attachmentPath ?? ""],
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: Decorations.boxDecorationBorder(
          radius: 0,
          borderColor: kGray_70.withOpacity(0.41),
        ),
        child: Column(
          children: [
            TextValue(
              text: strings.notes,
              value: e.issueDescription ?? "",
              textStyle: titleStyle,
              valueStyle: valueStyle,
            ),
            SizedBox(height: 10),
            ShowImagesWidget(image: e.attachmentPath ?? ""),
          ],
        ),
      ),
    );
  }
}
