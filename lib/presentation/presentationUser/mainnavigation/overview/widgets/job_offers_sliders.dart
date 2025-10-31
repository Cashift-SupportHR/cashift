import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base/user_info_widget.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../domain/entities/user_overview/job_offer_slider.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../common/common_state.dart';
import '../../../resources/colors.dart';

class JobOffersSlidersWidget extends BaseStatelessWidget {
  final StreamState<List<JobOfferSlider>> jobOffersSliders;
  final Function(int)? onApplyJobNow;
  final Function( )? canSubmitLogistics;

  JobOffersSlidersWidget({
    Key? key,
    required this.jobOffersSliders,
    this.onApplyJobNow,
    this.canSubmitLogistics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return StreamBuilder<List<JobOfferSlider>>(
      stream: jobOffersSliders.stream,
      builder: (context, snapshot) {
        if (snapshot.data != null &&
            snapshot.data!.first.details != null &&
            snapshot.data!.first.details!.isNotEmpty) {
          count = jobOffersSliders.data?.first.details?.length ?? 1;
        }
        return (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.isEmpty)
            ? const SizedBox()
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: Text(strings.private, style: kTextMedium),
                ),
                SizedBox(
                  height: 160 + (count * 11) + (count.isOdd ? 11 : 0),
                  child: Swiper(
                    itemCount: snapshot.data?.length ?? 0,
                    // index: snapshot.data!.length - 1,
                    itemWidth: double.infinity,
                    itemBuilder: (BuildContext context, int index) {
                      return SlideItem(
                        jobOfferSlider: snapshot.data![index],
                        onApplyJobNow: onApplyJobNow,
                        canSubmitLogistics: canSubmitLogistics,
                      );
                    },
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey.withOpacity(0.5),
                        space: 1,
                        activeColor: Theme.of(context).primaryColor,
                        size: 8,
                      ),
                    ),
                    viewportFraction: 0.95,
                    scale: 0.8,
                    autoplay: false,
                    autoplayDisableOnInteraction: true,
                  ),
                ),
              ],
            );
      },
    );
  }
}

class SlideItem extends BaseStatelessWidget {
  final JobOfferSlider jobOfferSlider;
  final Function(int)? onApplyJobNow;
  final Function( )? canSubmitLogistics;

  SlideItem({Key? key, required this.jobOfferSlider, this.canSubmitLogistics, this.onApplyJobNow})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(jobOfferSlider.isOnlyBackGround);
    print("jkjkklkkjk");

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 10, bottom: 30, right: 0),
      padding: const EdgeInsetsDirectional.all(10),
      decoration: Decorations.decorationNetworkImageAndShadow(
        jobOfferSlider.backGroundLogo ?? '',
      ),
      child:
          jobOfferSlider.isOnlyBackGround == true
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [button(context)],
              )
              : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoWidget(
                        image: jobOfferSlider.mainLogo ?? '',
                        imageSize: 60,
                        border: 1,
                        name: jobOfferSlider.header?.titleHeader ?? '',
                        subTitle: jobOfferSlider.header?.subTitleHeader ?? '',
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        nameStyle: kTextSemiBold.copyWith(
                          fontSize: 22,
                          color: kPrimary,
                        ),
                        subTitleStyle: kTextSemiBold.copyWith(
                          fontSize: 18,
                          color: kBlack_3C,
                        ),
                      ),
                      body(),
                      Spacer(),
                      SizedBox(height: 40, child: footer(context)),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 20,
                        top: 10,
                      ),
                      child: kBuildImage(
                        jobOfferSlider.companyLogo ?? '',
                        border: 0,
                        size: 30,
                        showImageError: false,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Widget body() {
    int count = 1;
    if (jobOfferSlider.details != null && jobOfferSlider.details!.isNotEmpty) {
      count = jobOfferSlider.details?.length ?? 1;
    }
    return SizedBox(
      height: (count * 11) + (count.isOdd ? 11 : 0),
      child: GridView.builder(
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 7,
          crossAxisSpacing: 5,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              kBuildImage(
                jobOfferSlider.details?[index].image ?? '',
                border: 0,
                size: 18,
              ),
              Text(
                jobOfferSlider.details?[index].title ?? '',
                style: kTextMedium.copyWith(fontSize: 10, color: kPrimary),
              ),
              const SizedBox(width: 5),
              Text(
                jobOfferSlider.details?[index].description ?? '',
                style: kTextMedium.copyWith(fontSize: 8, color: kGreen_61),
              ),
              // IconDoubleTextFixedBox(
              //   isImage: true,
              //   padding: EdgeInsets.zero,
              //   icon: jobOfferSlider.details?[index].image ?? '',
              //   iconSize: 18,
              //   name: jobOfferSlider.details?[index].title ?? '',
              //   value: jobOfferSlider.details?[index].description ?? '',
              //   nameStyle: kTextMedium.copyWith(fontSize: 10, color: kPrimary),
              //   valueStyle: kTextMedium.copyWith(fontSize: 8, color: kGreen_61),
              // ),
            ],
          );
        },
      ),
    );
  }

  Widget footer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 5),
            child: Text(
              jobOfferSlider.footer?.titleFooter ?? '',
              style: kTextSemiBold.copyWith(fontSize: 18, color: kBlack_3C),
            ),
          ),
        ),
        Spacer(),
        // kBuildImage(jobOfferSlider.footer?.imageFooter ?? '',
        //     border: 0, size: 45),
        // SizedBox(
        //   width: 10,
        // ),
        button(context),
      ],
    );
  }

  button(context) {
    return SizedBox(
      width: 100,
      height: 35,
      child: AppCupertinoButton(
        text: jobOfferSlider.actionName ?? strings.apply_now,
        padding: EdgeInsets.symmetric(vertical: 0),
        onPressed:
            () =>
                jobOfferSlider.code == "delivery"
                    ?canSubmitLogistics!()
                    : onApplyJobNow!(jobOfferSlider.id ?? 0),
        textStyle: kTextBold.copyWith(fontSize: 12, color: kWhite),
      ),
    );
  }
}
