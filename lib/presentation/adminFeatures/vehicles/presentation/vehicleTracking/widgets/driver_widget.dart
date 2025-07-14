
import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/index.dart';
   import '../../../../../presentationUser/resources/colors.dart';
  import '../../../domain/entities/vehicleTraking.dart';

class ItemDriverTracking extends BaseStatelessWidget {
  List<DriverEntity>? drivers;
  ItemDriverTracking({required this.drivers});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (context, index) {
            List<ListRowTextItem> items = [
              ListRowTextItem(
                  title: strings.driver_name,
                  value: drivers?[index].freelancerInfoName ?? "",
                  icon: AppIcons.driver1),
              ListRowTextItem(
                  title: strings.project_name,
                  value: drivers?[index].projectName ?? "",
                  icon: AppIcons.projectName),
              ListRowTextItem(
                  title: strings.working_period,
                  value: drivers?[index].shiftName ?? "",
                  icon: AppIcons.time3),
            ];
            return Container(
              decoration: Decorations.decorationTabs,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListRowTextsIconsV2(iconColor: kPrimary, items: items),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: drivers?.length ?? 0),
    );
  }
}
