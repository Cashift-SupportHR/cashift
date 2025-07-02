import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../shared/components/index.dart';

class CountItemWidget extends BaseStatelessWidget {
  final int  emp ;
  final int  power ;

  CountItemWidget({super.key, required this.emp, required this.power});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: Decorations.decorationTabs,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      kLoadSvgInCirclePath(AppIcons.t1),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        strings.total_contracting_power,
                        style: kTextMedium.copyWith(
                            fontSize: 12, color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        power.toString(),
                        style:
                            kTextBold.copyWith(fontSize: 25, color: kPrimary),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        strings.power,
                        style: kTextMedium.copyWith(
                            fontSize: 12, color: kPrimary),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: Decorations.decorationTabs,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(

                    children: [
                      kLoadSvgInCirclePath(AppIcons.t2),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        strings.total_attendance,
                        style: kTextMedium.copyWith(
                            fontSize: 12, color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        emp.toString(),
                        style:
                            kTextBold.copyWith(fontSize: 25, color: kPrimary),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        strings.employee,
                        style: kTextMedium.copyWith(
                            fontSize: 12, color: kPrimary),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
