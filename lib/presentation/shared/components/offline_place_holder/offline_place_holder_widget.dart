import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../common/domain/entities/attendancerecoginatin/register_attendance_offline_request_shift.dart';
import '../../../../main_index.dart';
import '../base_stateless_widget.dart';
import '../decorations/decorations.dart';

class OfflinePlaceHolderWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<OfflineData> data = [
      OfflineData(
          image: AppIcons.cha1,
          name: strings.chashift_attendance,
          description: strings.chashift_attendance_finger,
          route:  Routes.cashiftAttendancePage,
        arguments: RegisterAttendanceOfflineRequestShift(isDTA: false, type: 1),

      ),
      OfflineData(
          image: AppIcons.cha2,
          name: strings.chashift_attendance_dta,
          description: strings.chashift_attendance_finger,
          route:  Routes.cashiftAttendancePage,
          arguments: RegisterAttendanceOfflineRequestShift(isDTA: true, type: 1),
      ),
    ];
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: kToolbarHeight),
        child: Column(
          children: [
            SvgPicture.asset(AppIcons.internet),
            SizedBox(
              height: 20,
            ),
            Text(
              strings.no_internet,
              style: kTextBold.copyWith(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: Text(
                strings.no_internet_description,
                textAlign: TextAlign.center,
                style: kTextMedium.copyWith(fontSize: 12, color: kGray_6D),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if(data[index].route != null) {
                          Navigator.pushNamed(context, data[index].route!, arguments: data[index].arguments);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: Decorations.createRectangleDecoration(),
                        child: Row(
                          children: [
                            SvgPicture.asset(data[index].image),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  data[index].name,
                                  style: kTextBold.copyWith(
                                      fontSize: 15, color: kPrimaryDark),
                                ),
                                Text(
                                  data[index].description,
                                  style: kTextMedium.copyWith(
                                      fontSize: 12, color: kGray_6D),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded,color: kPrimary,)
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class OfflineData {
  final String image;
  final String name;
  final String description;
  final String? route;
  final dynamic arguments;

  OfflineData(
      {required this.image, required this.name, required this.description, this.route, this.arguments});
}
