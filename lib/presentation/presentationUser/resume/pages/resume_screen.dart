import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/domain/entities/resume/index.dart';
import 'package:shiftapp/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/presentationUser/resume/pages/PersonalInfo.dart';
import 'package:shiftapp/presentation/presentationUser/resume/pages/education_info.dart';
import 'package:shiftapp/presentation/presentationUser/resume/pages/favoritejobs/pages/favorite_jobs_screen.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_widget.dart';
import 'package:shiftapp/presentation/shared/components/dropdown_filed.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/presentation/shared/components/stepper.dart';
import 'package:shiftapp/core/utils/app_utils.dart';
import 'package:shiftapp/data/models/resuame/index.dart';

 import '../../../../core/utils/app_icons.dart';
import '../../../shared/components/datepicker/hijri_calendar.dart';
import '../../../shared/components/datepicker/hijri_picker.dart';
import '../../../shared/components/image_builder.dart';
import 'favorite_times/favorite_times_screen.dart';

class ResumeScreen extends BaseWidget {
  bool isInitiate = false;

  final ResumeComponentData resumeComponentData;
  Function(UpdateResumeParams) onPerformUpdate;

  ResumeScreen(
      {Key? key,
      required this.resumeComponentData,
      required this.onPerformUpdate})
      : super(key: key);

  final birthDateController = TextEditingController();
  final _pageController = PageController();
  final _pageControllerStream = BehaviorSubject<int>();

  Stream<int> get pageStream => _pageControllerStream.stream;
  UpdateResumeParams updateResumeParams = UpdateResumeParams();
  int index = 1;
  final ScrollController scrollController = ScrollController();

  moveToNext(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  moveToPrevious() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  List<Widget> getPages(BuildContext context) {
    final bloc = BlocProvider.of<ResumeBloc>(context);
    updateResumeParams.gender = resumeComponentData.resume.gender;
    final pages = [
      PersonalInfoScreen(
        resumeComponentData: resumeComponentData,
        controller: scrollController,
        onSubmit: (PersonalInfo personalInfo) {
          print('personalInfo: ${personalInfo.districtId}');
          updateResumeParams.name = personalInfo.name.toString();
          updateResumeParams.email = personalInfo.email;
          updateResumeParams.cityId = personalInfo.cityId;
          updateResumeParams.birthDate = personalInfo.normalizeDate();
          updateResumeParams.idNumber = personalInfo.idNumber;
          updateResumeParams.isHijri = personalInfo.isHijri;
          updateResumeParams.gender = personalInfo.isMale;
          updateResumeParams.length = personalInfo.length;
          updateResumeParams.weight = personalInfo.weight;
          updateResumeParams.districtId = personalInfo.districtId;

          print(
              'UpdatePersonalInfo ${updateResumeParams.gender} = ${personalInfo.isMale}');
          bloc.add(UpdatePersonalInfo(personalInfo));
          if (updateResumeParams.districtId != null) {
            moveToNext(1);
          } else {
            moveToNext(2);
          }
          moveToNext(1);
        },
        onFetchDistricts: (int cityId) {
          bloc.add(FetchDistricts(cityId: cityId));
        },
      ),
      EducationInfoScreen(
        resumeComponentData: resumeComponentData,
        controller: scrollController,
        onSubmit: (EducationInfo educationInfo) {
          updateResumeParams.qualificationData =
              educationInfo.qualificationDegreeId;
          updateResumeParams.qualificationName =
              educationInfo.qualificationName;
          updateResumeParams.computerLevel = educationInfo.computerLevel;
          updateResumeParams.englishLevel = educationInfo.englishLevel;
          updateResumeParams.currentSituation = educationInfo.currentSituation;
          print('EducationInfoScreen ${updateResumeParams.gender}');

          bloc.add(UpdateEducation(educationInfo));
          moveToNext(2);
        },
        onBack: () {
          moveToPrevious();
        },
      ),
      FavoriteTimesScreen(
        resumeComponentData: resumeComponentData,
        controller: scrollController,
        onSubmit: (FavoriteTimeInfo favoriteTimeInfo) {
          updateResumeParams.favourateHours = favoriteTimeInfo.favourateHours;
          updateResumeParams.timeWorkId = favoriteTimeInfo.timeWorkId;
          bloc.add(UpdateFavoriteTimes(favoriteTimeInfo));
          moveToNext(3);
        },
        onBack: () {
          moveToPrevious();
        },
      ),
      FavoriteJobsScreen(
        resumeComponentData: resumeComponentData,
        controller: scrollController,
        onSubmit: (List<int> favJobs) {
          updateResumeParams.listOfJob = favJobs;
          updateResumeParams.id = 0;
          onPerformUpdate(updateResumeParams);
        },
        onBack: () {
          moveToPrevious();
        },
        isMale: updateResumeParams.gender = true,
      ),
    ];
    return pages;
  }

  List<String> getPagesTitles() {
    final pages = <String>[
      strings.profile,
      strings.education,
      strings.favorite_work_times,
      strings.previous_experiences
    ];
    return pages;
  }

  @override
  Widget buildWidget(BuildContext context) {
    _pageControllerStream.sink.add(1);
    return AppScaffold(
        title: strings.resume,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: StreamBuilder<int>(
                  stream: pageStream,
                  initialData: 1,
                  builder: (context, snapshot) {
                    return MLinearStepIndicator(
                      steps: 4,
                      verticalPadding: 0,
                      backgroundColor: kBackground,
                      controller: _pageController,
                      activeBorderColor: kPrimary,
                      selectedBorderColor: kPrimary,
                      inActiveBorderColor: kGrey_6,
                      activeNodeColor: kPrimary,
                      selectedNodeColor: kBackground,
                      inActiveNodeColor: kBackground,
                      activeIconColor: kPrimary,
                      selectedIconColor: kPrimary,
                      inActiveIconColor: kGrey_6,
                      nodeSize: 40,
                      nodeThickness: 4,
                      activeLineHeight: 4,
                      inActiveLineHeight: 1,
                      activeLineColor: kPrimary,
                      inActiveLineColor: kGrey_6,
                      iconSize: 12,
                      icons: const [
                        AppIcons.person,
                        AppIcons.qualified,
                        AppIcons.favoriteWorkTime,
                        AppIcons.favorite,
                      ],
                      completedWidget: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kWhite,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: kLoadSvgInCirclePath(
                          AppIcons.done,
                          width: 15,
                          height: 15,
                        ),
                      ),
                      labels: [
                        strings.personal_info,
                        strings.qualification,
                        strings.favorite_work_times,
                        strings.favorite_jobs
                      ],
                      complete: () {
                        //typically, you'd want to put logic that returns true when all the steps
                        //are completed here
                        return Future.value(true);
                      },
                      initSteps: snapshot.requireData - 1,
                    );
                  }),
            ),
            Expanded(
              child: PageView(
                children: getPages(context),
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  _pageControllerStream.sink.add(index + 1);
                },
              ),
            ),
          ],
        ));
  }
}

Widget kBuildIcon(String path) {
  return Image.asset(
    path,
    color: kAccent,
    scale: 3,
  );
}

class DatePickerField extends StatefulWidget {
  final String? initText;
  final String? label;
  final bool? isHijri;
  final Function(String gDate, bool isHijri, String? hDate) onSelectDate;

  const DatePickerField(
      {Key? key,
      this.initText,
      this.label,
      required this.onSelectDate,
      this.isHijri = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DatePickerField();
  }
}

class _DatePickerField extends State<DatePickerField> {
  String selectedDate = "";
  final birthDateController = TextEditingController();
  HijriCalendar? hSelectedDate;
  DateTime? gSelectedDate;
  bool isHijri = true;

  Future<void> openDatePicker(BuildContext context) async {
    var initDate = gSelectedDate ?? DateTime(DateTime.now().year - 17);

    if (gSelectedDate == null)
      initDate = initDate.subtract(const Duration(days: 1));

    final lastDate = DateTime(DateTime.now().year - 17);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(1940, 1, 1),
        lastDate: lastDate,
        locale: context.getLocal());

    if (pickedDate != null) {
      gSelectedDate = pickedDate;
      selectedDate = DateFormatter.formatDate(
          gSelectedDate!, DateFormatter.DAY_MONTH_YEAR);

      birthDateController.text = selectedDate;
      widget.onSelectDate(
          DateFormatter.formatDate(gSelectedDate!, DateFormatter.DAY_MONTH_YEAR,
              local: 'en'),
          false,
          null);
    }
  }

  openHijriPicker() async {
    final jLastDate = DateTime(DateTime.now().year - 17);
    final lastDate = HijriCalendar.fromDate(jLastDate);

    final firstDate = HijriCalendar.fromDate(DateTime(1940, 1, 1));
    final pickedDate = await showHijriDatePicker(
      context: context,
      initialDate: hSelectedDate ?? lastDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: DatePickerMode.day,
    );

    if (pickedDate != null) {
      hSelectedDate = pickedDate;
      gSelectedDate = hSelectedDate!.hijriToGregorian(
          hSelectedDate!.hYear, hSelectedDate!.hMonth, hSelectedDate!.hDay);

      final hijriDate =
          AppUtils.replaceArabicNumber(hSelectedDate!.toFormat('dd/mm/yyyy'));
      birthDateController.text = hijriDate;
      selectedDate = DateFormatter.formatDate(
          gSelectedDate!, DateFormatter.DAY_MONTH_YEAR,
          local: 'en');
      widget.onSelectDate(selectedDate, true, hijriDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.getStrings();
    const labelStyle = kTextLabelFontDark;
    final itemDecoration = kTextFieldDecoration;
    final labelFloatStyle = kTextLabelFontDark.copyWith(color: kAccent);
    return MaterialTextField(
      readOnly: true,
      onTap: () {
        if (isHijri) {
          openHijriPicker();
        } else {
          openDatePicker(context);
        }
      },
      controller: birthDateController,
      autovalidateMode: AutovalidateMode.disabled,
      style: kTextRegular.copyWith(color: kAlmostBlack, fontSize: 12),
      inputDecoration: itemDecoration.copyWith(
          labelStyle: labelStyle.copyWith(color: Colors.grey),
          floatingLabelStyle: labelFloatStyle,
          prefixIcon: const Icon(
            Icons.calendar_today,
            color: kAccent,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(top: 8, end: 8),
            child: Column(
              children: [
                Text(
                  strings.hijri,
                  style: kTextMedium.copyWith(fontSize: 13),
                ),
                Checkbox(
                  value: isHijri,
                  onChanged: (checked) {
                    setState(() {
                      isHijri = checked == true;
                      clearText();
                    });
                  },
                  activeColor: kPrimary,
                  checkColor: Colors.white,
                ),
              ],
            ),
          )),
      validator: (value) {
        print(
            'ON SELECT new date validate ${value} =${value == null || value.length < 6}');

        if (value.isNullOrEmpty()) {
          return strings.please_entry_birthdate;
        }
        return null;
      },
    );
  }

  String getSelectedDate() {
    if (isHijri) {
      return AppUtils.replaceArabicNumber(
          hSelectedDate!.toFormat('dd/mm/yyyy'));
    } else {
      return DateFormatter.formatDate(
          gSelectedDate!, DateFormatter.DAY_MONTH_YEAR,
          local: 'en');
    }
  }

  @override
  void initState() {
    isHijri = widget.isHijri ?? true;
    if (!widget.initText.isNullOrEmpty()) {
      selectedDate = widget.initText!;
      print('initState selectedDate $isHijri => $selectedDate}');

      final date = DateFormatter.dateFromString(selectedDate,
          pattern: DateFormatter.DAY_MONTH_YEAR);
      hSelectedDate = HijriCalendar.fromDate(date);
      gSelectedDate = date;
      birthDateController.text = getSelectedDate();
      print('initState date $isHijri => ${getSelectedDate()}');
    }
    super.initState();
  }

  void clearText() {
    birthDateController.text = '';
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  AutocompleteBasicExample(
      {Key? key,
      required this.options,
      required this.onSelectItem,
      this.inputDecoration,
      this.validator,
      this.controller,
      this.onChanges,
      this.selectedIndex})
      : super(key: key);

  final ScrollController? controller;
  final List<String> options;
  final int? selectedIndex;
  final Function(int) onSelectItem;
  final Function(String value)? onChanges;
  final InputDecoration? inputDecoration;
  final FormFieldValidator<String>? validator;
  bool isClickSelect = false;

  @override
  Widget build(BuildContext context) {
    final items = <Item>[];
    for (int i = 0; i < options.length; i++) {
      items.add(Item(index: i, value: options[i]));
      print('build options ${options[i]}');
    }
    if (selectedIndex != null) {
      isClickSelect = true;
    }
    print('builSELECTED AUTO ${selectedIndex}');

    return Autocomplete<Item>(
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            onChanged: (t) {
              print('ONChangeAutoSearch $t');
              if (isClickSelect == false && !options.contains(t)) {
                //onSelectItem(-1);
              }
              if (onChanges != null) {
                onChanges!(t);
              }
              isClickSelect = false;
            },
            style: kTextRegular.copyWith(color: kAlmostBlack, fontSize: 12),
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: inputDecoration != null
                ? inputDecoration!.copyWith(
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black45,
                    ),
                  )
                : kTextFieldDecoration.copyWith(
                    suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                  )));
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Item>.empty();
        }
        return items.where((element) => element.value
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
        /*  return items.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });*/
      },
      initialValue: TextEditingValue(
          text: selectedIndex != null && selectedIndex! > -1
              ? items[selectedIndex!].value
              : ''),
      optionsViewBuilder: (context, onAutoCompleteSelect, options) {
        return Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              // size works, when placed here below the Material widget
              child: Container(
                  height: options.length * 30,
                  constraints: const BoxConstraints(maxHeight: 400),
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListView.separated(
                    controller: controller,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: options.length,
                    separatorBuilder: (context, i) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final item = options.toList()[index];
                      return InkWell(
                          onTap: () {
                            onAutoCompleteSelect(item);
                          },
                          child:
                              Container(height: 30, child: Text(item.value)));
                    },
                  )),
            ));
      },
      displayStringForOption: (item) {
        return item.value;
      },
      onSelected: (Item selection) {
        print('You just selected $selection');
        isClickSelect = true;
        onSelectItem(selection.index);
      },
    );
  }
}
