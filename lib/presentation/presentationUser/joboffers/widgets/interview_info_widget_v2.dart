import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/decorations/decorations.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../core/services/routes.dart';
import '../../../../domain/entities/jobs/interview_info.dart';
import '../../../../domain/entities/jobs/job_terms.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../shared/components/buttons/app_outline_button_icon.dart';
import '../../../shared/components/dialogs_manager.dart';
import '../../../shared/home/pages/home_screen.dart';
import '../../appliedoffers/details/applied_offer_details_screen_v2.dart';
import '../../resources/colors.dart';

class InterviewInfoWidgetV2 extends BaseStatelessWidget {
  final JobTerms job;
  final bool  ? matchHeight  ;
  InterviewInfoWidgetV2({Key? key,  required this.job, this.matchHeight, }) : super(key: key);

  static show(BuildContext context, JobTerms job) {
   DialogsManager.showAlertDialog(context, InterviewInfoWidgetV2(job: job, matchHeight: false,));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    kBuildImage(
                      job.companyLogo ?? '',
                      border: 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(job.mainLabel ?? '', style: kTextMedium.copyWith(color: kPrimary, fontSize: 12)),
                    SizedBox(height: 5),
                    Text(job.companyName ?? '', style: kTextBold.copyWith(color: kPrimary, fontSize: 12)),
                    SizedBox(height: 5),
                    Text(job.subMainLabel ?? '', style: kTextMedium.copyWith(color: kBlack_45, fontSize: 12)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 255 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image: NetworkImage(job.supLogo ?? ''),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _CardInformation(
            interviewInfo: job.interviewInfo ?? InterviewInfo(),
          ),
          Spacer(),
          AppOutlineButtonIcon(
            icon: AppIcons.openMapOutline,
            onClick: () {
              launchLocation();
            },
            text: strings.open_map,
            child: Text(strings.open_map, style: kTextMedium.copyWith(fontSize: 14,color: kPrimary),),
            padding: EdgeInsets.all(14),
            width: double.infinity,
            radius: 4,
          ),
          SizedBox(
            height: 10,
          ),
          AppCupertinoButton(
            text: strings.back_to_home_page,
            onPressed: () {
              int count = 0;
              Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
            },
            radius:BorderRadius.all(Radius.circular(4)),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
  void launchLocation(){
   AppUtils.launchMap(lat: job.interviewInfo?.latitude.toString() ?? '', long: job.interviewInfo?.longtude.toString() ?? '');
  }
}

class _CardInformation extends BaseStatelessWidget {
  final InterviewInfo interviewInfo;
  _CardInformation({Key? key, required this.interviewInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TermInfo> items = [
      TermInfo(title: strings.name, value: interviewInfo.name ?? '',icon: AppIcons.personOutline),
      TermInfo(title: strings.phone, value: interviewInfo.phone ?? '',icon: AppIcons.phoneOutline),
      TermInfo(title: strings.date, value: interviewInfo.workDays ?? '',icon: AppIcons.dateOutline),
      TermInfo(title: strings.time, value: interviewInfo.timesOfWork ?? '',icon: AppIcons.timeOutline),
      TermInfo(title: strings.area, value: interviewInfo.cityName ?? '',icon: AppIcons.areaOutline),
    ];
    return Container(
      padding: EdgeInsets.all(12),
      decoration: Decorations.decorationConditions,
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return OpportunityTermItem(
            title: items[index].title + ' :',
            value: items[index].value,
            image: items[index].icon,
            isDivider: false,
            imageSize: 20,
            isSizedBox: true,
            titleStyle: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
            valueStyle: kTextMedium.copyWith(fontSize: 14, color: kGreen_51),
          );
        },
      ),
    );
  }
}
class TermInfo{
  final String title;
  final String value;
  final String icon;
  TermInfo({required this.title,required this.value,required this.icon});
}
