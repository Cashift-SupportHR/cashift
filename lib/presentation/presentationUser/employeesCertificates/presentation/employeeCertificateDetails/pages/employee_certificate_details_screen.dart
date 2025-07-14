import 'package:flutter/material.dart';

import '../../../../../../common/components/base/user_info_widget.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../../../domain/entities/employees_certificates.dart';
import '../widgets/customer_reviews_widget.dart';
import '../widgets/previous_experience_widget.dart';

// Not used
class EmployeesCertificatesScreen extends BaseStatelessWidget {
  final int type;
  final List<EmployeeCertificate> data;
  final Function(int) onReset;
  EmployeesCertificatesScreen({Key? key, required this.data, required this.type, required this.onReset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: Decorations.shapeDecoration(radius: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings.personal_information,
                    style: kTextRegular.copyWith(color: kRateBarIconColor, fontSize: 14),
                  ),
                  SizedBox(height: 14),
                  UserInfoWidget(
                    image: 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                    name: 'سلمان محمد الجساس',
                    subTitle: 'مبتدأ',
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            PreviousExperienceWidget(),
            SizedBox(height: 14),
            CustomerReviewsWidget(),
          ],
        ),);
  }
}
