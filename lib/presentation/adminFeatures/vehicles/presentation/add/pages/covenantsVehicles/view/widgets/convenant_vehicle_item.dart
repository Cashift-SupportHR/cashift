import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../../shared/components/index.dart';
import '../../../../../../domain/entities/covenant_vehicle.dart';
import '../../add/add_covenant_vehicle_builder.dart';

class CovenantVehicleItem extends BaseStatelessWidget {
  final CovenantVehicle item;
  final Function() onRefresh;
  final Function(int) onDelete;

  CovenantVehicleItem(
      {super.key,
      required this.item,
      required this.onRefresh,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: Decorations.shapeDecorationShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          SizedBox(height: 10),
          description(context),
        ],
      ),
    );
  }

  Row header(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kBuildCircleImage(item.custodyImagePath ?? '', size: 51),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.name ?? '',
                  style: kTextSemiBold.copyWith(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
        AppIconButton(
            iconSize: 22, icon: AppIcons.edit, onTap: () => onEdit(context)),
        SizedBox(width: 16),
        AppIconButton(
          iconSize: 22,
          icon: AppIcons.deleteOutline,
          onTap: () => onDelete(item.id ?? 0),
        ),
      ],
    );
  }
  Text description(BuildContext context) {
    return Text(
      item.description ?? '',
      style: kTextRegular.copyWith(color: kGray_42, fontSize: 12),
    );
  }


  void onEdit(BuildContext context) {
    return AddCovenantVehicleBuilder.show(context,
      initialData: item,
      vehicleId: item.vehicleId ?? 0,
      onRefresh: onRefresh,
    );
  }

}
