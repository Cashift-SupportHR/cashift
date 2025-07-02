import 'package:shiftapp/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../domain/entities/EmployeeChasfiterDetails.dart';

class EmployeeInfoScreen extends BaseStatelessWidget {
  final Function() onPrevious;
  final Function() onNext;
  final EmployeeChasfiterDetails data;
  bool isEdit;
  EmployeeInfoScreen(
      {super.key,
      required this.data,
      required this.isEdit,
      required this.onPrevious,
      required this.onNext});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: isEdit == true
          ? SizedBox()
          : RowButtons(
              textSaveButton: strings.next,
              textCancelButton: strings.previous,
              onSave: () {
                onNext();
              },
              onCancel: () {
                onPrevious();
              },
            ),
      body: Column(
        children: [
          headerWidget(context),
          baseInfoWidget(context),
          workInfoWidget(context),
        ],
      ),
    );
  }

  headerWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Row(
        children: [
          kBuildCircleImage(data.profileImagePath ?? "", size: 50),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data.name ?? "",
                  style: kTextMedium.copyWith(color: kBlack, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: kGrey62,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      data.phoneNumber ?? "",
                      style: kTextMedium.copyWith(color: kGrey62, fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: kGrey62,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      data.email ?? "",
                      style: kTextMedium.copyWith(color: kGrey62, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  baseInfoWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          IconText(
              text: strings.base_inf,
              icon: AppIcons.infoEmp,
              textColor: kOrange_09),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListRowTexts(
                  flex: 2,
                  titleStyle:
                      kTextMedium.copyWith(fontSize: 12, color: kPrimary),
                  titles: [
                    strings.id_number,
                    strings.type,
                    strings.city,
                  ],
                  values: [
                    data.idNumber ?? "",
                    data.gender ?? "",
                    data.cityName ?? "",
                  ],
                ),
              ),
              Expanded(
                child: ListRowTexts(
                  flex: 2,
                  titleStyle:
                      kTextMedium.copyWith(fontSize: 12, color: kPrimary),
                  titles: [
                    strings.birthdate,
                    strings.age,
                  ],
                  values: [
                    DateFormatter.formatDateString(data.dateOfBirth ?? "",
                        DateFormatter.TIME_STAMP, DateFormatter.DAY_MONTH_YEAR),
                    data.age.toString() ?? "",
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  workInfoWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          IconText(
              text: strings.work_inf,
              icon: AppIcons.bagWorkOutline,
              textColor: kOrange_09),
          SizedBox(
            height: 10,
          ),
          ListRowTexts(
            flex: 2,
            titleStyle: kTextMedium.copyWith(fontSize: 12, color: kPrimary),
            titles: [
              strings.level_computer,
              strings.current_state,
              strings.level_eng,
              strings.level_education,
            ],
            values: [
              data.computerLevel.toString() ?? "",
              data.currentSituation.toString(),
              data.englishLevel.toString() ?? "",
              data.qualificationName.toString() ?? "",
            ],
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  strings.favorite_proportion,
                  style: kTextMedium.copyWith(fontSize: 12, color: kPrimary),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.favoriteJobs?.length,
                  itemBuilder: (context, index) => Text(
                    "${data.favoriteJobs?[index] ?? ""} , ",
                    style: kTextMedium.copyWith(fontSize: 12, color: kGreen_85),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
