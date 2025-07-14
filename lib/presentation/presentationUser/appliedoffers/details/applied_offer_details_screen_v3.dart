import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/details/widgets/uniform_slides.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/user_info_widget.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import '../../../../common/domain/entities/appliedOffers/index.dart';
import '../../../../common/domain/entities/shift/index_shift.dart';
import '../../../../utils/app_icons.dart';
import '../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/map/map_widget.dart';
import '../../../../common/components/outlint_button.dart';
import '../../appliedoffers/details/widgets/decoration_container.dart';
import 'widgets/job_details_applied_offer_details.dart';


class AppliedOfferDetailsScreenV3 extends BaseStatelessWidget {
  final AppliedOffer appliedOffers;
  final Function(AppliedOffer) performAttendance;
  final Function(int) cancelShift;

  AppliedOfferDetailsScreenV3({
    Key? key,
    required this.appliedOffers,
    required this.performAttendance,
    required this.cancelShift,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                companyInfo(),
                // _Slides(),
                const SizedBox(height: 16,),

                OpportunityDetailsAppliedOfferDetails(appliedOffer: appliedOffers),
                const SizedBox(
                  height: 20,
                ),
                if (appliedOffers.listJobUniForm != null && appliedOffers.listJobUniForm!.isNotEmpty)
                  UniformSlides(listJobUniForm: appliedOffers.listJobUniForm ?? []),
                const SizedBox(height: 16,),
                _AttendanceConditions(appliedOffer: appliedOffers),

                const SizedBox(
                  height: 20,
                ),
                _JobLocation(location: appliedOffers.location(), projectAddress:  appliedOffers.address),

                const SizedBox(
                  height: 20,
                ),
                //
                // const SizedBox(
                //   height: 20,
                // ),

              ],
            ),
          ),
        ),
        _ButtonsAction(
          appliedOffers: appliedOffers,
          performAttendance: (appliedOffers) => performAttendance(appliedOffers),
          cancelShift: (id) => cancelShift(id),
        ),
      ],
    );
  }

  Widget companyInfo(){
    return
      UserInfoWidget(
        image: appliedOffers.logo(),
        decoration: Decorations.shapeDecorationBorderCircular(),
        name: appliedOffers.jobName ?? '',
        subTitle: appliedOffers.address  ?? '',
        nameStyle: kTextBold.copyWith(fontSize: 14, color: kPrimary),
        subTitleStyle: kTextBold.copyWith(fontSize: 14, color: kBlack.withOpacity(0.7)),
      );
  }

}

class _Slides extends BaseStatelessWidget {
  _Slides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: kBackground,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: Decorations.decorationContainer,
              child: kBuildImage('https://static8.depositphotos.com/1141099/803/i/950/depositphotos_8039156-stock-photo-prakasam-barrage-bridge.jpg'));
        },
        itemCount: 3,
        pagination: const SwiperPagination(builder: DotSwiperPaginationBuilder(
          activeColor: kBluish,
        )),
      ),
    );
  }
}


class _AttendanceConditions extends BaseStatelessWidget {
  final AppliedOffer appliedOffer;
  _AttendanceConditions({Key? key, required this.appliedOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [
      {
        'image': AppIcons.hours,
        'type': strings.working_hours2,
        'value':'${ appliedOffer.workingHoursCount() } ${strings.hour}',
      },
      {
        'image': AppIcons.qrCodeSearch,
        'type': strings.attendance_method,
        'value':(appliedOffer.requiredQr() ? strings.qr_scanner : strings.location) ?? '',
      },
      {
        'image': AppIcons.calendar,
        'type': strings.beginning_work,
        'value': appliedOffer.startDateTimeString() ?? '',
      },
      {
        'image': AppIcons.timer,
        'type': strings.end_work,
        'value': appliedOffer.finishedDateTimeString(),
      }

    ];
    return BackgroundContainer(
      title: strings.attendance_conditions,
      child: Column(
        children: items.map((e) => OpportunityTermItem(
          image: e['image'],
          title: e['type'],
          value: e['value'],
          isDivider: items.indexOf(e) != items.length - 1,
        )).toList(),
      ),
    );
  }
}

class OpportunityTermItem extends BaseStatelessWidget {
  final String image;
  final String title;
  final String value;
  final bool? isDivider;
  final double? imageSize;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final bool? isSizedBox;

  OpportunityTermItem(
      {Key? key,
        required this.image,
        required this.title,
        required this.value,
        this.isDivider = true,
        this.imageSize,
        this.titleStyle,
        this.valueStyle,
        this.isSizedBox = false,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: kLoadSvgInCirclePath(
                        image,
                        height: imageSize ?? 14,
                        width: imageSize ?? 14,
                      ),
                    ),
                    if(isSizedBox!)
                      const SizedBox(
                        width: 8,
                      ),
                    Expanded(
                      flex: 5,
                      child: Text(
                          title,
                          style: titleStyle ?? kTextMedium.copyWith(color: kPrimary, fontSize: 12)
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  value,
                  style: valueStyle ?? kTextSemiBold.copyWith(color: kAlmostBlack, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        isDivider!
            ? const Divider(
          color: kGrey_2,
          thickness: 1,
        )
            : const SizedBox(),
      ],
    );
  }
}


class _JobLocation extends BaseStatelessWidget {
  final LatLng location;
  final String? projectAddress;
  _JobLocation({Key? key, required this.location, this.projectAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      title: strings.location,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectAddress ?? '',
            style: kTextRegular.copyWith(color: kFontDark, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: StaticMapWidget(
                  location: location,
                  title: projectAddress!,
                )),
          )
        ],
      ),
    );
  }
}


class _ButtonsAction extends BaseStatelessWidget {
  final AppliedOffer appliedOffers;
  final Function(AppliedOffer) performAttendance;
  final Function(int) cancelShift;

  _ButtonsAction({Key? key, required this.appliedOffers, required this.performAttendance, required this.cancelShift}) : super(key: key);

  String statusButtonName(AppliedOffer shift) {
    return shift.isAccept() ? strings.checkin : strings.checkout;
  }

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          appliedOffers.ableToAttendance()?
          Expanded(
            child: AppCupertinoButton(
              text: statusButtonName(appliedOffers),
              radius: BorderRadius.circular(8),
              onPressed:()=> performAttendance(appliedOffers),
            ),
          ):Container(),
          const SizedBox(
            width: 10,
          ),

          appliedOffers.ableToAttendance()?
          Expanded(
            child: AppOutlineButton(
              onClick:()=> cancelShift(appliedOffers.id!),
              text: strings.cancel_shift_title,
              textColor: kRed,
              radius: 8,
              borderWidth: 1,
              strokeColor: kRed,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ):Container(),
        ],
      ),
    );
  }
}
