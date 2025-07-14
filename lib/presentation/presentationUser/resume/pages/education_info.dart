import 'package:collection/collection.dart'; // You have to addopportunityemployee this manually, for some reason it cannot be added automatically
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/resume/education_info.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/presentationUser/resume/pages/resume_screen.dart';
import 'package:shiftapp/presentation/presentationUser/resume/widgets/base_resume_widget.dart';
import 'package:shiftapp/common/components/bottom_sheet/list_picker_widget.dart';
import 'package:shiftapp/presentation/shared/components/dropdown_filed.dart';

class EducationInfoScreen extends BaseResumeWidget<EducationInfo> {
  int? qualificationId;
  String? qualificationName;
  int? currentSituation, computerLevel, englishLevel;

  final _formKey = GlobalKey<FormState>();

  Function(EducationInfo educationInfo) onSubmit;
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController qualificationNameController =
      TextEditingController();
  final TextEditingController computerLevelController = TextEditingController();
  final TextEditingController languageLevelNameController =
      TextEditingController();
  final TextEditingController currentSituationController =
      TextEditingController();

  EducationInfoScreen(
      {Key? key,
      required ResumeComponentData resumeComponentData,
      required ScrollController controller,
      required this.onSubmit,
      Function? onBack})
      : super(
            key: key,
            controller: controller,
            onBack: onBack,
            resumeComponentData: resumeComponentData);

  @override
  Widget buildResumeWidget(BuildContext context, EducationInfo? educationInfo) {
    int? selectedName;
    if (educationInfo != null) {
      qualificationId = educationInfo.qualificationDegreeId;
      qualificationName = educationInfo.qualificationName;
      currentSituation = educationInfo.currentSituation;
      englishLevel = educationInfo.englishLevel;
      computerLevel = educationInfo.computerLevel;

      selectedName = resumeComponentData.qualificationNames
          .indexWhere((element) => element == qualificationName);

      if (qualificationName != null && selectedName < 0) {
        resumeComponentData.qualificationNames.add(qualificationName!);
      }
      if (educationInfo.computerLevel != null) {
        computerLevelController.text = resumeComponentData.levels
                .firstWhereOrNull(
                    (element) => element.id == educationInfo.computerLevel)
                ?.levelName ??
            '';
      }

      if (educationInfo.currentSituation != null) {
        currentSituationController.text = resumeComponentData.situations
                .firstWhereOrNull(
                    (element) => element.id == educationInfo.currentSituation)
                ?.levelName ??
            '';
      }

      print(
          'educationInfo ${educationInfo.englishLevel != null} => ${educationInfo.englishLevel}');
      if (educationInfo.englishLevel != null) {
        final enLevel = resumeComponentData.levels
            .firstWhereOrNull(
                (element) => element.id == educationInfo.englishLevel)
            ?.levelName;
        print('enLevel $enLevel');

        languageLevelNameController.text = enLevel ?? '';
      }
      qualificationNameController.text = qualificationName ?? '';
      qualificationController.text = resumeComponentData.qualifications
              .firstWhereOrNull((element) => element.id == qualificationId)
              ?.levelName ??
          '';
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildQualificationPicker(context),
            //  buildQualificationNamePicker(context),
            Text(
              strings.qualification_name,
              style: labelStyle,
            ),
            AutocompleteBasicExample(
              onChanges: (value) {
                validate();
                qualificationName = value;
                //qualificationName = resumeComponentData.qualificationNames[index];
              },
              selectedIndex: selectedName,
              validator: (value) {
                qualificationName = value;
                if (qualificationId == 1) {
                  return null;
                } else if (qualificationName.isNullOrEmpty()) {
                  return strings.invalid_qualification_name;
                }
                return null;
              },
              inputDecoration: kTextFieldDecoration.copyWith(
                floatingLabelStyle: labelFloatStyle,
                labelStyle: labelStyle,
              ),
              options: resumeComponentData.qualificationNames,
              onSelectItem: (i) {
                validate();
              },
            ),
            SizedBox(
              height: 16,
            ),
            buildComputerLevelPicker(context),
            buildLanguageLevelPicker(context),
            buildCurrentSituationsPicker(context),
          ],
        ),
      ),
    );
  }

  @override
  validate() {
    if (qualificationId == 1) {
      validateForm(true);
    } else {
      validateForm(
          _formKey.currentState!.validate() == true && qualificationId != null);
    }
  }

  @override
  onClickSubmit() {
    onSubmit(createEducationInfo());
  }

  @override
  Stream<EducationInfo> setStream() {
    return resumeBloc!.educationInfoStream.stream;
  }

  Widget buildQualificationPicker(BuildContext context) {
    return buildTextFieldItemClickable(
        onTap: () {
          ListPickerWidget.showPicker(
              context: context,
              title: strings.select_qualification,

              items: resumeComponentData.qualifications
                  .map((e) => Item(index: e.id!, value: e.levelName ?? ''))
                  .toList(),
              onSelectItem: (item) {
                qualificationId = item.index;
                qualificationController.text = item.value;
                validate();
              });
        },
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return strings.invalid_qualifi;
          }
          return null;
        },
        controller: qualificationController,
        onChanged: (text) {},
        title: strings.education);
  }

  Widget buildQualificationNamePicker(BuildContext context) {
    return buildTextFieldItemClickable(
        onTap: () {
          ListPickerWidget.showPicker(
              context: context,
              setSearch: true,
              title: strings.select_qualification_name,
              items: resumeComponentData.qualificationNames
                  .map((e) => Item(index: 0, value: e ?? ''))
                  .toList(),
              searchHint: strings.search_for_your_qualification_name,
              onSelectItem: (item) {
                qualificationNameController.text = item.value;
                qualificationName = item.value;
                validate();
              });
        },
        controller: qualificationNameController,
        validator: (value) {
          qualificationName = value;
          print(
              'sequalificationId ${qualificationId} => ${qualificationId == 1}');
          if (qualificationId == 1) {
            return null;
          } else if (qualificationName.isNullOrEmpty()) {
            return strings.invalid_qualification_name;
          }
          return null;
        },
        onChanged: (text) {},
        title: strings.qualification_name);
  }

  Widget buildComputerLevelPicker(BuildContext context) {
    return buildTextFieldItemClickable(
        onTap: () {
          ListPickerWidget.showPicker(
              context: context,
              title: strings.select_computer_level,
              items: resumeComponentData.levels
                  .map((e) => Item(index: e.id!, value: e.levelName ?? ''))
                  .toList(),
              onSelectItem: (item) {
                computerLevelController.text = item.value;
                computerLevel = item.index;
                validate();
              });
        },
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return strings.invalid_comp_level;
          }
          return null;
        },
        controller: computerLevelController,
        onChanged: (text) {},
        title: strings.select_computer_level);
  }

  Widget buildLanguageLevelPicker(BuildContext context) {
    return buildTextFieldItemClickable(
        onTap: () {
          ListPickerWidget.showPicker(
              context: context,
              title: strings.select_english_level,
              items: resumeComponentData.levels
                  .map((e) => Item(index: e.id!, value: e.levelName ?? ''))
                  .toList(),
              onSelectItem: (item) {
                languageLevelNameController.text = item.value;
                englishLevel = item.index;
                validate();
              });
        },
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return strings.invalid_lang_level;
          }
          return null;
        },
        controller: languageLevelNameController,
        onChanged: (text) {},
        title: strings.select_english_level);
  }

  Widget buildCurrentSituationsPicker(BuildContext context) {
    return buildTextFieldItemClickable(
        onTap: () {
          ListPickerWidget.showPicker(
              context: context,
              title: strings.select_current_situation,
              items: resumeComponentData.situations
                  .map((e) => Item(index: e.id!, value: e.levelName ?? ''))
                  .toList(),
              onSelectItem: (item) {
                currentSituationController.text = item.value;
                currentSituation = item.index;
                validate();
              });
        },
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return strings.please_select_current_situation;
          }
          return null;
        },
        controller: currentSituationController,
        onChanged: (text) {},
        title: strings.current_situation);
  }

  EducationInfo createEducationInfo() {
    return EducationInfo(
        qualificationName: qualificationName,
        computerLevel: computerLevel,
        englishLevel: englishLevel,
        qualificationDegreeId: qualificationId,
        currentSituation: currentSituation);
  }
}
