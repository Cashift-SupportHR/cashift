import '../../../../core/utils/app_icons.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../index.dart';

class DetailsButtons extends BaseStatelessWidget {
  final String? title;
  final void Function()? onTap;
  final String? routeNamed;
  final dynamic arguments;
  DetailsButtons({super.key, this.title, this.onTap, this.routeNamed, this.arguments});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? onTap : routeNamed != null ?
          () => Navigator.pushNamed(context, routeNamed!, arguments: arguments) : null,
      child: IconText(
        icon: AppIcons.hazard_details,
        text: title ?? strings.show_details,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.only(top: 5),
      ),
    );
  }
}
