import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/job_offers_widget_helper.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/curancy_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';
import 'package:shiftapp/common/components/outlint_button.dart';
import 'package:shiftapp/common/components/shapes/rounded_shape.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/base/base_widget.dart';
import '../../../../common/components/page_slider_widget.dart';
import '../../mainnavigation/overview/widgets/slider_widget.dart';

class JobOfferItemWidget extends BaseStatelessWidget {
  final JobOfferDto jobOffer;
  final Function? onClickApply;
  final bool? matchWidth;
  final bool? mapView;
  final bool? listView;

  final bool? special;
  final bool? isSpecialSlider;
  JobOfferItemWidget(this.jobOffer,
      {Key? key,
      required this.onClickApply,
      this.special,
      this.listView,
      this.matchWidth = true,
      this.mapView = false,
      this.isSpecialSlider,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("JobOfferItemWidget special: $special");
    print("JobOfferItemWidget special: $mapView");
    print("JobOfferItemWidget special: $isSpecialSlider");

    return isSpecialSlider == true ? OfferSliderWidget(
        jobOffer,
      onClickApply: (){
        toDetails(context);
      },
      onClickDetails: (){
        //toDetails(context);
      },
    ) :
      special == true
        ? _JobFutureOfferItemBuilder(jobOffer, onClickApply: () {
            toDetails(context);
          }, onClickDetails: () {
            toDetails(context);
          })
        : listView == true
            ? _JobOfferListItemBuilder(
                jobOffer,
                onClickApply: () {
                  toDetails(context);
                },
                onClickDetails: () {
                //  toDetails(context);
                },
              )
            : mapView == true
                ? _JobOfferItemBuilderMapView(
                    jobOffer,
                    onClickApply: () {
                      toDetails(context);
                    },
                    onClickDetails: () {
                      toDetails(context);
                    },
                  )
                : _JobOfferItemBuilder(
                    jobOffer,
                    onClickApply: () {
                      toDetails(context);
                    },
                    onClickDetails: () {
                      toDetails(context);
                    },
                  );
  }

  Future<void> toDetails(BuildContext context) async {
    print('toDetails');
    // final isApplied = await navigateToDetails(context);
    // if (isApplied == true && onClickApply != null) {
    //   onClickApply!();
    // }
    onClickApply!();
  }

}

class _JobOfferItemBuilder extends JobOfferItemBuilderBase {
  _JobOfferItemBuilder(JobOfferDto jobOffer,
      {required Function onClickApply, required Function onClickDetails})
      : super(jobOffer,
            onClickApply: onClickApply, onClickDetails: onClickDetails);

  @override
  Widget buildWidget(BuildContext context) {
    print('_JobOfferItemBuilder ${jobOffer.toJson()}');
    return Stack(
      children: [
        Container(
          decoration: cardDecoration(jobOffer),
          padding: const EdgeInsets.all(12.0),
          margin:
              const EdgeInsetsDirectional.only(start: 16, top: 4, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(jobOffer),
              const SizedBox(
                height: 10,
              ),
              buildAddress(jobOffer, context),
              const SizedBox(
                height: 4,
              ),
              FittedBox(child: buildShiftTime(jobOffer)),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: buildJobRequirement(jobOffer, context)),
                    buildProjectLogo(),
                  ],
                ),
              ),
              buildApplyButton(jobOffer, context)
            ],
          ),
        ),
        jobOffer.isVIP()
            ? Positioned(
                right: 0,
                child: SvgPicture.asset(
                  'images/vip.svg',
                  height: 22,
                  width: 43,
                ))
            : const SizedBox(),
      ],
    );
  }

  BoxDecoration cardDecoration(jobOffer) {
    print("cardDecoration special: ${jobOffer.projectlogo}");
    return BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: kGrey_D6,
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(2, 2), // c
        )
      ],
      image: jobOffer.joblogo == null
          ? null
          : DecorationImage(
              image: Image.network(
                jobOffer.joblogo,
                errorBuilder: (context, _, c) {
                  return Container();
                },
              ).image,
              fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(10),
    );
  }

  final cardSpeicialDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: kPrimary.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 5,
        offset: const Offset(2, 2), // c
      )
    ],
    borderRadius: BorderRadius.circular(10),
  );
}

class _JobOfferListItemBuilder extends JobOfferItemBuilderBase {
  _JobOfferListItemBuilder(JobOfferDto jobOffer,
      {required Function onClickApply, required Function onClickDetails})
      : super(jobOffer,
            onClickApply: onClickApply, onClickDetails: onClickDetails);

  @override
  Widget buildWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: cardDecoration(jobOffer),
          padding: const EdgeInsets.all(12.0),
          margin:
              const EdgeInsetsDirectional.only( top: 4, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(jobOffer),
              const SizedBox(
                height: 10,
              ),
              buildAddress(jobOffer, context),
              const SizedBox(
                height: 4,
              ),
              buildShiftTime(jobOffer),
              Row(
                children: [
                  Expanded(child: buildJobRequirement(jobOffer, context)),
                  buildProjectLogo(),
                ],
              ),
              buildApplyButton(jobOffer, context)
            ],
          ),
        ),
        jobOffer.isVIP()
            ? Positioned(
                right: 0,
                child: SvgPicture.asset(
                  'images/vip.svg',
                  height: 22,
                  width: 43,
                ))
            : const SizedBox(),
      ],
    );
  }

  BoxDecoration cardDecoration(jobOffer) {
    print("cardDecoration special: ${jobOffer.projectlogo}");
    return BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: kGrey_D6,
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(2, 2), // c
        )
      ],
      image: jobOffer.joblogo == null
          ? null
          : DecorationImage(
              image: Image.network(
                jobOffer.joblogo,
                errorBuilder: (context, _, c) {
                  return Container();
                },
              ).image,
              fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(10),
    );
  }

  final cardSpeicialDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: kPrimary.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 5,
        offset: const Offset(2, 2), // c
      )
    ],
    borderRadius: BorderRadius.circular(10),
  );
}

class _JobFutureOfferItemBuilder extends JobOfferItemBuilderBase {
  _JobFutureOfferItemBuilder(JobOfferDto jobOffer,
      {required Function onClickApply, required Function onClickDetails})
      : super(jobOffer,
            onClickApply: onClickApply, onClickDetails: onClickDetails);

  @override
  Widget buildWidget(BuildContext context) {
    print('SPECIAL OFFER ${jobOffer.toJson()}');
    return Stack(
      children: [
        Container(
          decoration: cardDecoration.copyWith(
              image: jobOffer.joblogo.isNullOrEmpty()
                  ? null
                  : DecorationImage(
                      image: Image.network(
                        jobOffer.joblogo!,
                        errorBuilder: (context, _, c) {
                          return Container();
                        },
                      ).image,
                      fit: BoxFit.cover)),
          margin:
              const EdgeInsetsDirectional.only(start: 16, top: 0, bottom: 4),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 16, start: 8),
                  child: buildTitle(jobOffer),
                ),
                const SizedBox(
                  height: 16,
                ),
                buildAddress(jobOffer, context),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        opportunityFees(context),
                        const SizedBox(
                          height: 4,
                        ),
                        buildJobRequirement(jobOffer, context),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    )),
                    buildProjectLogo(),
                  ],
                ),
                buildApplyButton(jobOffer, context, ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
        PositionedDirectional(
            start: 6,
            top: 0,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'images/hot_offer.png',
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Center(
                    child: Text(
                  strings.exclusive,
                  style:
                      kTextRegular.copyWith(color: Colors.white, fontSize: 10),
                )),
              ],
            ))
      ],
    );
  }

  final cardDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: kGrey_D6,
        spreadRadius: 2,
        blurRadius: 2,
        offset: Offset(2, 2), // c
      )
    ],
    borderRadius: BorderRadius.circular(10),
  );

  final cardSpeicialDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: kPrimary.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 5,
        offset: const Offset(2, 2), // c
      )
    ],
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget buttonText(BuildContext context) {
    return Text(
      strings.apply_now,
      style: kButtonTextStyle,
    );
  }

  @override
  Widget buildAddress(JobOfferDto jobOffer, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: SvgPicture.asset('images/location.svg'),
        ),
        Text(
          '${strings.location}  : ',
          style: kTextRegularPrimary.copyWith(fontSize: 12),
        ),
        Text(
          jobOffer.projectAddress ?? "",
          style: kTextRegularGrey.copyWith(fontSize: 12),
        ),
        const Spacer(),
        navigateLocationButton(context),
      ],
    );
  }

  @override
  Widget buildJobRequirement(JobOfferDto jobOffer, BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildChip(jobOffer.jobRequirements!.gender.toString()),
          buildChip(strings.dates_not_set),
        ],
      ),
    );
  }
}

class _JobOfferItemBuilderMapView extends JobOfferItemBuilderBase {
  _JobOfferItemBuilderMapView(JobOfferDto jobOffer,
      {required Function onClickApply, required Function onClickDetails}) : super(jobOffer, onClickApply: onClickApply, onClickDetails: onClickDetails);

  @override
  Widget buildWidget(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Card(
          elevation: 4,
          shadowColor: kGrey_D6,
          color: Colors.grey.shade50,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(jobOffer),
                const SizedBox(
                  height: 16,
                ),
                buildAddress(jobOffer, context),
                const SizedBox(
                  height: 4,
                ),
                buildShiftTime(jobOffer),
                const SizedBox(
                  height: 12,
                ),
              //  buildApplyButton(jobOffer, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class JobOfferItemBuilderBase extends BaseWidget {
  final JobOfferDto jobOffer;
  final Function? onClickApply;
  final Function onClickDetails;
  JobOfferItemBuilderBase(this.jobOffer, { this.onClickApply, required this.onClickDetails});

  @override
  void onRequestFail(Object error) {
    // TODO: implement onRequestFail
    super.onRequestFail(error);
  }
  Widget buildTitle(JobOfferDto job) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kBuildImage(job.logo(), size: 50),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(child: jobName(job)),
                  if(job.showQuantity == true)
                  remainingCountWidget(job),
                ],
              ),
              buildProjectNameWidget(job)
            ],
          ),
        )
      ],
    );
  }

  Widget buildAddress(JobOfferDto jobOffer, BuildContext context) {
    return MaterialText(
      jobOffer.projectAddress!,
      style: kTextRegular.copyWith(fontSize: 12, color: kDarkGrey),
      startIconPadding: const EdgeInsetsDirectional.only(end: 16),
      startIcon: SvgPicture.asset('images/location.svg'),
      endIconPadding: const EdgeInsetsDirectional.only(start: 20),
      mathWidth: true,
      endIcon: navigateLocationButton(context),
    );
  }

  Widget buildJobRequirement(JobOfferDto jobOffer, BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildChip(jobOffer.jobRequirements!.gender.toString()),
          jobOffer.qualificationName != null
              ? buildChip(jobOffer.qualificationName!.toString())
              : const SizedBox(),
          const SizedBox(
            width: 4,
          ),
          buildChip(
              jobOffer.jobRequirements!.hoursCount.toString() + strings.hours),
          /*      SizedBox(width: 4,),

          buildChip(
              (jobOffer.avg?.round().toString().addCurrency(context)??'') +' / '+ strings.hour)*/
        ],
      ),
    );
  }

  Widget buildApplyButton(JobOfferDto jobOffer, BuildContext context, {bool isLastButtonAlignment = true, double? sizeIcon}) {
    return Row(
      children: [
        favoriteIcon(sizeIcon: sizeIcon),
        const SizedBox(
          width: 12,
        ),
        if(isLastButtonAlignment)
          ...[shareIconButton(sizeIcon: sizeIcon),
            const SizedBox(
              width: 12,
            ),],
        Expanded(
          child: AppCupertinoButton(
            child: buttonText(context),
            padding: const EdgeInsets.all(5),
            radius: BorderRadius.circular(10),
            onPressed: () {
              onClickApply!();
            },
            height: 38,
          ),
        ),
        if(!isLastButtonAlignment)
          ...[
            const SizedBox(
              width: 12,
            ),
            shareIconButton(sizeIcon: sizeIcon),],
      ],
    );
  }
  Widget shareIconButton({double? sizeIcon}){
    return  SizedBox(
        height: sizeIcon ?? 35,
        width: sizeIcon ?? 40,
        child: AppOutlineButton(
          onClick: () {
            onClickShare(jobOffer.id.toString());
          },
          borderWidth: 0.8,
          radius: 10,
          child: Image.asset(
            'images/share.png',
            color: kPrimary,
            colorBlendMode: BlendMode.srcIn,
          ),
        ));
  }
Widget favoriteIcon({double? sizeIcon}){
    return  SizedBox(
        height: sizeIcon ?? 35,
        width: sizeIcon ?? 40,
        child: AppOutlineButton(
          onClick: () {},
          borderWidth: 0.8,
          radius: 10,
          child: Image.asset(
            jobOffer.isFavorite() == true
                ? 'images/heart_fill.png'
                : 'images/heart.png',
            color: kPrimary,
            colorBlendMode: BlendMode.srcIn,
          ),
        ));
}
  buildChip(String name) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      backgroundColor: kSilverTwo.withOpacity(0.14),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget buildShiftTime(JobOfferDto jobOffer) {
    return MaterialText(
      getShiftTime(jobOffer),
      style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
      startIconPadding: const EdgeInsetsDirectional.only(end: 16),
      startIcon: SvgPicture.asset('images/clock.svg'),
      endIconPadding: const EdgeInsetsDirectional.only(start: 20),
    );
  }

  String getShiftTime(JobOfferDto jobOffer) {
    final start = hourFromDate(jobOffer.opportunitiesEndTime ?? '');
    final end = hourFromDate(jobOffer.opportunitiesStrartTime ?? '');
    final date = jobOffer.workingDateString();
    return '$date  $end  -  $start';
  }

  String hourFromDate(String date) {
    return DateFormatter.formatDateString(
        date, DateFormatter.HOUR_MINUT, DateFormatter.HOUR_MINUT_12,
        local: local);
  }

  Widget buildProjectNameWidget(JobOfferDto job, {bool isPadding = true}) {
    return Padding(
      padding: isPadding ? const EdgeInsetsDirectional.only(end: 16) : EdgeInsets.zero,
      child: Text(
        job.projectName!,
        style: kTextRegular.copyWith(
            color: kDarkGrey, fontSize: 12, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Future<void> onClickShare(String id) async {
    progress.show();
    final url = await JobOfferWidgetHelper.createDynamicLink(id);
    progress.dismiss();
    requestShare(url ?? '');
  }

  Widget jobName(JobOfferDto job, {TextStyle? style}) {
    return Text(
      job.jobName ?? '',
      style: style ?? kTextMedium.copyWith(fontSize: 14),
    );
  }

  Widget remainingCountWidget(JobOfferDto job) {
    return Align(
        alignment: AlignmentDirectional.topCenter,
        child: RoundedShape(
          width: 70,
          height: 28,
          color:
              (jobOffer.isExpired() ? Colors.red : kPrimary).withOpacity(0.10),
          child: Text(
            remainingCount(job),
            style: kTextMedium.copyWith(
                fontSize: 10,
                color: (jobOffer.isExpired() ? Colors.red : kPrimary)),
          ),
        ));
  }

  String remainingCount(JobOfferDto job) {
    return jobOffer.isExpired()
        ? '${jobOffer.requirmentCount} ${strings.expired}'
        : '${jobOffer.requirmentCount}  ${strings.remaining}  ${jobOffer.actualNumber} ';
  }

  Widget buildRateWidget() {
    return Row(
      children: [
        MaterialText(
          '4.5',
          startIconPadding: const EdgeInsetsDirectional.only(end: 6),
          startIcon: Image.asset(
            'images/star.png',
            height: 10,
          ),
          style: kTextRegular.copyWith(fontSize: 9, color: kCoolGrey),
        ),
        Text(
          '(45)',
          style: kTextRegular.copyWith(color: kPrimary, fontSize: 9),
        )
      ],
    );
  }

  Widget navigateLocationButton(BuildContext context, {double? sizeIcon}) {
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () {
          JobOfferWidgetHelper.openMap(context, jobOffer);
        },
        style: TextButton.styleFrom(
            fixedSize: const Size.fromHeight(20),
            padding: const EdgeInsets.all(0)),
        child: MaterialText(
          strings.open_map,
          style: kTextRegular.copyWith(color: kPrimary, fontSize: 10),
          endIcon: Image.asset(
            'images/gps.png',
            height: sizeIcon ?? 10,
            width: sizeIcon ?? 10,
          ),
        ),
      ),
    );
  }

  Widget opportunityFees(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: SvgPicture.asset('images/location.svg'),
        ),
        Text(
          strings.opportunity_value + ' : ',
          style: kTextRegularPrimary.copyWith(fontSize: 12),
        ),
        if(jobOffer.showPrice == true)
          CurancyWidget(valuePrice:  jobOffer.salary.toString(),valueStyle:  kTextRegularGrey.copyWith(fontSize: 12),)

      ],
    );
  }

  Widget buttonText(BuildContext context) {
    return
      Row(
        crossAxisAlignment:CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(strings.earning_now,style:kTextRegular.copyWith(fontSize: 14, color: Colors.white) ,),
          if(jobOffer.showPrice == true)
          CurancyWidget(valuePrice: jobOffer.salary.toString(),valueStyle:  kTextRegular.copyWith(color: kButterScotch, fontSize: 14),)
        ],
      );


  }

  Widget buildProjectLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 60,
        height: 60,
        child: kBuildImageV2(jobOffer.projectlogo ?? '', showImageError: false),
      ),
    );
  }
}
