import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/jobs/interview_info.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/material_text.dart';
import 'package:shiftapp/common/components/outlint_button.dart';
import 'package:shiftapp/utils/app_utils.dart';

class InterviewInfoWidget extends BaseStatelessWidget {
  InterviewInfoWidget({Key? key, required this.model , this.matchHeight }) : super(key: key);

  static show(BuildContext context, InterviewInfo model) {
    DialogsManager.showAlertDialog(context, InterviewInfoWidget(model: model,matchHeight: false,));
  }

  final InterviewInfo model;
  final bool  ? matchHeight  ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('images/checked.svg', height: 80),
          const SizedBox(
            height: 16,
          ),
          Text(
            model.description ?? '',
            style: kTextMedium.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 24,
          ),
          MaterialText(
            model.name ?? '',
            style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
            startIconPadding: const EdgeInsetsDirectional.only(end: 16),
            startIcon: SvgPicture.asset('images/profile.svg'),
          ),
          TextButton(
            onPressed: () {
              AppUtils.launchPhone(phone: model.phone.toString());
            },
            style: ButtonStyle(
              padding:MaterialStateProperty.all(EdgeInsets.all(0)),
            ),
            child: MaterialText(
              model.phone ?? '',
              style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
              startIconPadding: const EdgeInsetsDirectional.only(end: 16),
              startIcon: SvgPicture.asset('images/call.svg'),
            ),
          ),
          MaterialText(
            model.workDays ?? '',
            style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
            startIconPadding: const EdgeInsetsDirectional.only(end: 16),
            startIcon: const Icon(
              Icons.calendar_today_outlined,
              color: kBattleShipGrey,
              size: 15,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          MaterialText(
            model.timesOfWork ?? '',
            style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
            startIconPadding: const EdgeInsetsDirectional.only(end: 16),
            startIcon: SvgPicture.asset('images/clock.svg'),
          ),
          const SizedBox(
            height: 16,
          ),
          MaterialText(
            model.cityName ?? '',
            style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
            startIconPadding: const EdgeInsetsDirectional.only(end: 16),
            startIcon: SvgPicture.asset('images/location.svg'),
          ),
          matchHeight==true ?Spacer(): const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: AppOutlineButton(
                  onClick: () {
                    launchLocation();
                  },
                  text: strings.open_map,
                  child: Text(strings.open_map, style: kTextMedium.copyWith(fontSize: 14,color: kPrimary),),
                  borderWidth: 2,
                  radius: 10,
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: AppCupertinoButton(
                  text: strings.ok_button,
                  onPressed: () {
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  },
                  radius:BorderRadius.all(Radius.circular(10)) ,
                  padding: EdgeInsets.all(6),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void launchLocation(){
    AppUtils.launchMap(lat: model.latitude.toString(), long: model.longtude.toString());
  }
}
