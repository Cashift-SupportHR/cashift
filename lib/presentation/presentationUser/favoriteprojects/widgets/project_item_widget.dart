import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/projects/project.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';

class ProjectItemWidget extends BaseStatelessWidget {
  final Project project ;
  final bool isSelected ;
  Color textColor = kGreyishBrown;
  Color subtextColor = kBattleShipGrey;
  Color selectedColor = kPrimaryDark;
  Color unselectedColor = Colors.white;

  Color selectedIconColor = Colors.white;
  Color unselectedIconColor = kPrimaryDark.withOpacity(0.10);

  Color currentIconColor = Colors.white;
  Color currentFillColor = kPrimaryDark;
  ProjectItemWidget({required this.project ,required this.isSelected});
  @override
  Widget build(BuildContext context) {

    currentFillColor = isSelected ? selectedColor : unselectedColor;
    textColor = isSelected ? Colors.white : kAlmostBlack;
    subtextColor = isSelected ? Colors.white : kBattleShipGrey;
    currentIconColor = isSelected ? selectedIconColor : unselectedIconColor;
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: currentFillColor, width: 1)),
      color: currentFillColor,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         /*   kBuildCircleShape(
                child: Image.network(project.logo??'',width: 40,height: 40,fit: BoxFit.cover),
                size: 50,
                color: currentIconColor),*/
            kBuildCircleImage(project.logo ?? ''),
            SizedBox(
              height: 16,
            ),
            Text(
              project.projectName ?? '',
              softWrap: true,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: kTextRegular.copyWith(fontSize: 12, color: textColor),
            ),
            Expanded(
              child: Text(
                project.address ?? '',
                softWrap: true,
                textAlign: TextAlign.center,
                style: kTextRegular.copyWith(fontSize: 12, color: subtextColor),
              ),
            ),
            // Text('20 وظيفة',style: kTextLight.copyWith(fontSize: 10,color:subtextColor ),)
          ],
        ),
      ),
    );
  }

  cardDecoration() {
    return BoxDecoration();
  }

  projectTitle() {
    return Text(project.projectName ?? '');
  }

}