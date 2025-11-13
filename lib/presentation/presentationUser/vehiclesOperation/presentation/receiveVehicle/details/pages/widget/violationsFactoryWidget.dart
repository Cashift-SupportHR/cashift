import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/receiveVehicle/details/pages/widget/showImagesListWidget.dart';

import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../adminFeatures/vehicles/domain/entities/vehicle_violation.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../../shared/components/map/points_map_screen.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';

import '../../bloc/receive_vehicle_details_state.dart';
import 'customExpansionTile.dart';

class ViolationsFactoryWidget extends BaseStatelessWidget {
  final ReceiveVehicleDetailsState state;
  final Function(int) onFetchViolationsFactory;

  ViolationsFactoryWidget({
    super.key,
    required this.onFetchViolationsFactory,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);
    TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 12);

    return CustomExpansionTile(
      title: strings.violations_of_factory,
      icon: AppIcons.factoryViolationsv2,
      isShowBorder: false,
      countStream: state.contractViolationStream,
      onExpansionChanged: (value) {
        if (state.violationsFactory.data == null) {
          onFetchViolationsFactory(state.details.roundTripId ?? 0);
        }
      },
      child: StreamDataStateWidget<ContractViolationData?>(
        stream: state.violationsFactory,
        builder: (context, data) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data?.contractViolations?.length ?? 0,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              final item = data?.contractViolations![index];

              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: Decorations.boxDecorationBorder(radius: 0),
                child: Column(
                  children: [
                    ListRowTextsIconsV2(
                      titleStyle: titleStyle.copyWith(color: kPrimary),
                      valueStyle: valueStyle,
                      isExpanded: false,
                      iconColor: kPrimary,
                      paddingItem: EdgeInsets.only(bottom: 10),
                      items: [
                        ListRowTextItem(
                          icon: AppIcons.violation_type,
                          title: strings.violation_type,
                          value: item?.contractViolationType ?? "",
                        ),
                        ListRowTextItem(
                          icon: AppIcons.buildingsOutline,
                          title: strings.company_name,
                          value: item?.companyName,
                        ),
                        ListRowTextItem(
                          icon: AppIcons.streetName,
                          title: strings.street_name,
                          value: item?.streetName,
                        ),
                        ListRowTextItem(
                          icon: AppIcons.details,
                          title: strings.details,
                          value: item?.details,
                        ),
                        ListRowTextItem(
                          icon: AppIcons.attachments_hazard,
                          title: strings.attached_attachments,
                          value: "",
                        ),
                      ],
                    ),
                    ShowImagesListWidget(
                      images:
                          item?.contractViolationAttachments
                              ?.map((e) => e.path ?? "")
                              .toList(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
