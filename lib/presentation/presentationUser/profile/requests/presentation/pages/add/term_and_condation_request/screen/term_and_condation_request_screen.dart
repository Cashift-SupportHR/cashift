import 'package:shiftapp/core/services/routes.dart';

import '../../../../../../../../../main.dart';
import '../../../../../../../../../common/components/index.dart';
import '../../../../../../../resources/colors.dart';
import '../../../../../../../resources/constants.dart';
import '../../../../../domain/entities/TermsAndConditionsRequests.dart';

class TermCondationRequestsUserScreen extends BaseStatelessWidget {
  bool isCheck = false;
  final List<TermsAndConditionsRequests> data;

  TermCondationRequestsUserScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          kLoadSvgInCircle(
            "chek",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            strings.will_send_request,
            textAlign: TextAlign.center,
            style: kTextMedium.copyWith(
              fontSize: 16,
              color: kBlack,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            strings.ok_teams_ms,
            textAlign: TextAlign.center,
            style: kTextRegular.copyWith(
              fontSize: 14,
              color: kGray_64,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 2,
                  backgroundColor: Colors.black,
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Text(
                    data[index].name ?? "",
                    textAlign: TextAlign.start,
                    style: kTextRegular.copyWith(
                      fontSize: 12,
                      color: kGray_64,
                    ),
                  ),
                ),
              ],
            ),
          )),
          Row(
            children: [
              StatefulBuilder(builder: (context, setState) {
                return Checkbox(
                  activeColor: kOrange00,
                  checkColor: kOrange00,
                  focusColor: kOrange00,
                  value: isCheck,
                  onChanged: (value) {
                    isCheck = !isCheck;
                    setState(() {});
                  },
                );
              }),
              Text(
                strings.confirm_yes,
                textAlign: TextAlign.center,
                style: kTextRegular.copyWith(
                  fontSize: 14,
                  color: kOrange00,
                ),
              ),
            ],
          ),
          RowButtons(
            onCancel: () {
              Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => true);
              Navigator.pushNamed(context, Routes.requestsUserPage);

            },
            textSaveButton: strings.ok_button,
            onSave: () {
              if (isCheck == false) {
                handleErrorDialog(strings.please_confirm_yes, context);
              } else {
                Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => true);
                 Navigator.pushNamed(context, Routes.requestsUserPage);
              }
            },
          )
        ],
      ),
    );
  }
}
