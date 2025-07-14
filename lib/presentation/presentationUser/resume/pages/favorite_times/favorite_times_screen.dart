import 'package:flutter/material.dart';

import '../../../../../common/domain/entities/resume/favorite_time.dart';
import '../../../../../common/domain/entities/resume/favorite_times_info.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../bloc/resume_component_data.dart';
import '../../widgets/base_resume_widget.dart';
import 'favorite_time_item.dart';

class FavoriteTimesScreen extends BaseResumeWidget<FavoriteTimeInfo> {
  final ResumeComponentData resumeComponentData;
  final Function(FavoriteTimeInfo) onSubmit;
  final _formKey = GlobalKey<FormState>();

  FavoriteTimesScreen({Key? key,
    required this.resumeComponentData,
    required this.onSubmit,
    required ScrollController controller,
    Function? onBack
  }) : super(
    key: key,
    resumeComponentData: resumeComponentData,
    controller: controller,
    onBack: onBack,
  );

  int? timeWorkId;
  int? favourateHours;
  @override
  onClickSubmit() {
    FavoriteTimeInfo favoriteTimeInfo = FavoriteTimeInfo(
        timeWorkId: timeWorkId,
        favourateHours: favourateHours
    );
    onSubmit(favoriteTimeInfo);
  }

  @override
  Stream<FavoriteTimeInfo> setStream() {
    return resumeBloc!.favoriteTimesStream.stream;
  }

  @override
  validate() {
    // _formKey.currentState!.validate() ==
    validateForm(_formKey.currentState!.validate() == true);
  }

  @override
  Widget buildResumeWidget(BuildContext context, FavoriteTimeInfo? model ) {
    if(model != null){
      timeWorkId = model.timeWorkId;
      favourateHours = model.favourateHours;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.favorite_work_times,
              style: kTextMedium.copyWith(fontSize: 14, color: kFontDark),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 95,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: resumeComponentData.favoriteTimes.length,
                    itemBuilder: (context, index) {
                      FavoriteTime favoriteTime = resumeComponentData.favoriteTimes[index];
                      return InkWell(
                        onTap: () {
                          timeWorkId = favoriteTime.id;
                          validate();
                          setState(() {});
                        },
                        child: FavoriteTimeItem(
                          favoriteTime: favoriteTime,
                          isSelected: timeWorkId == favoriteTime.id,
                        ),
                      );
                    },
                  );
                }
              ),
            ),
            const SizedBox(
              height: 20),
            buildTextFieldItem(
              title: strings.favorite_working_hours,
                initialValue: favourateHours?.toString(),
                keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return strings.please_enter_favorite_working_hours;
                }
                return null;
              },
              onChange: (value){
                favourateHours = int.parse(value);
              }

            ),
          ],
        ),
      ),
    );
  }


}
