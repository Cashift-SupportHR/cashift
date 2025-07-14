import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/decorations/decorations.dart';
import 'package:shiftapp/utils/app_images.dart';

import '../../../../common/data/repositories/local/local_repository.dart';
import '../../../../core/services/routes.dart';
import '../../../adminFeatures/di/injector.dart';
import '../../../presentationUser/profile/view/widgets/dropdown_language.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../components/base_stateless_widget.dart';
import '../../home/pages/home_screen.dart';
import '../widgets/custom_smooth_page_indicator.dart';
import '../widgets/landing_model.dart';
import '../widgets/landing_content.dart';

class LandingPage extends BaseStatelessWidget {

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List sliderPages = [
      LandingModel(
        image: AppImages.landingPage2,
        title: strings.allow_required_permissions,
        description: strings.location_disclosure,
        logo: AppImages.stcPay,
      ),
      LandingModel(
        image: AppImages.landingPage1,
        title: strings.landing_page_title1,
        description: strings.landing_page_desc1,
        logo: AppImages.stcPay,
      ),
      LandingModel(
        image: AppImages.landingPage2,
        title: strings.landing_page_title2,
        description: strings.landing_page_desc2,
        logo: '',
      ),
      LandingModel(
        image: AppImages.landingPage3,
        title: strings.landing_page_title3,
        description: strings.landing_page_desc3,
        logo: '',
      ),
      LandingModel(
        image: AppImages.landingPage4,
        title: strings.landing_page_title4,
        description: strings.landing_page_desc4,
        logo: '',
      ),
    ];
    int pageIndex = 1;
    PageController pageController = PageController();
    return Scaffold(
      body: StatefulBuilder(builder: (context, setState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  PageView.builder(
                    itemCount: sliderPages.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index + 1;
                      });
                    },
                    itemBuilder: (context, index) {
                      return LnadingContent(
                        landing: sliderPages[index],
                      );
                    },
                  ),
                  Container(
                    width: 60,
                    height: 32,
                    margin: const EdgeInsetsDirectional.only(top: kToolbarHeight, end: 14),
                    alignment: Alignment.center,
                    decoration: Decorations.decorationOnlyRadius(color: kWhite, radius: 10),
                    child: DropdownLanguage(
                        horizontalPadding: 5,
                    ),
                  ),
                ],
              ),
            ),
            CustomSmoothPageIndicator(
              count: sliderPages.length,
              controller: pageController,
            ),
            Image.asset(AppImages.landingPageLogo, height: 30),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                strings.platform_description,
                style: const TextStyle(
                  color: kGreen_3D,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            pageIndex == sliderPages.length
                ? AppCupertinoButton(
                    text: strings.lets_start,
                    radius: BorderRadius.circular(4),
                    margin: const EdgeInsets.all(25),
                    onPressed: () {
                      getIt<LocalRepository>().setFirstTime();

                      Navigator.pushReplacementNamed(
                          context, Routes.home);
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: GestureDetector(
                      onTap: () {
                        getIt<LocalRepository>().setFirstTime();

                        Navigator.pushReplacementNamed(
                            context, Routes.home);
                      },
                      child: Text(
                        strings.skip,
                        textAlign: TextAlign.center,
                        style: kTextBoldTitle.copyWith(
                            color: kGreen_2, fontSize: 14),
                      ),
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
