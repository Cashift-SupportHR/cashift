import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/index.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../core/services/routes.dart';
import '../../../../../../presentationUser/vehiclesOperation/domain/entities/vehicle_violation_args.dart';
import '../../../../data/models/index.dart';
import '../../../../domain/entities/index.dart';

class VehicleViolationItem extends BaseStatelessWidget {
  final ContractViolation item;
  final Function() onRefresh;
  final bool isPlan;
  VehicleViolationItem({
    Key? key,
    required this.item,
    required this.isPlan,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          isPlan == true
              ? SizedBox()
              : _OptionsMenuButton(id: item.id ?? 0, onRefresh: onRefresh),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildIconDoubleText(
                  icon: AppIcons.violation_type,
                  title: strings.violation_type,
                  value: item.contractViolationType ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.buildingsOutline,
                  title: strings.company_name,
                  value: item.companyName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.streetName,
                  title: strings.street_name,
                  value: item.streetName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.details,
                  title: strings.details,
                  value: item.details ?? '',
                ),
                detailsButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildIconDoubleText({
    required String icon,
    required String title,
    required String value,
    Color? colorText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconDoubleText(
        icon: icon,
        name: title + ' :',
        value: value,
        nameStyle: kTextRegular.copyWith(fontSize: 14, color: kPrimary),
        valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.vehicleViolationDetailsPage,
          arguments: item.id,
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
  final int id;
  final Function() onRefresh;
  _OptionsMenuButton({required this.id, required this.onRefresh, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 20;

    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_violation,
          iconPath: AppIcons.carEdit,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          final isRefresh = await Navigator.pushNamed(
            context,
            Routes.addViolationVehiclePage,
            arguments: AddVehicleViolationArgs(violationId: id),
          );
          if (isRefresh == true) {
            onRefresh();
          }
        }
      },
    );
  }
}
