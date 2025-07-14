import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/common/domain/entities/resume/city_item.dart';
import 'package:shiftapp/common/domain/entities/resume/personal_info.dart';
 import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/validation.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/presentationUser/resume/widgets/base_resume_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resume/widgets/city_picker_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resume/widgets/date_picker.dart';
 import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/utils/app_utils.dart';

import '../../../shared/authorization/signup/pages/signup_screen.dart';
 import '../../resources/colors.dart';
import '../widgets/district_picker_stream.dart';

class PersonalInfoScreen extends BaseResumeWidget<PersonalInfo> {

  final Function(PersonalInfo personalInfo) onSubmit;
  String? idNumber, name, email;
  int? length, weight;
  final _formKey = GlobalKey<FormState>();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final Function(int) onFetchDistricts;
  // kBuildImage
  bool isMale = true;
  String birthdate = "";
  bool? isHijri = true;
  int? cityId;
  int? districtId;
  bool approveCheckbox = false;
  Stream<bool> get approveCheck => _approveCheck.stream;
  final _approveCheck = BehaviorSubject<bool>();
  PersonalInfoScreen(
      {Key? key,
      required this.onSubmit,
      required ScrollController controller,
      required this.onFetchDistricts,
      required ResumeComponentData resumeComponentData})
      : super(
            key: key,
            controller: controller,
            resumeComponentData: resumeComponentData);

  PersonalInfo createPersonlInfo() {
    print('createDistrictId $districtId');
    return PersonalInfo(
        name: name,
        birthdate: birthdate,
        idNumber: idNumber,
        isMale: isMale,
        cityId: cityId ?? resumeComponentData.resume.cityId ?? 0,
        email: email,
        isHijri: isHijri,
        length: length,
        weight: weight,
        districtId: districtId ?? resumeComponentData.resume.districtId ?? 0
    );
  }


  @override
  onClickSubmit() {
    onSubmit(createPersonlInfo());
  }

  @override
  void validate() {

    validateForm(_formKey.currentState!.validate() == true&& approveCheckbox==true);
  }

  @override
  Stream<PersonalInfo> setStream() {
    return resumeBloc!.personalInfoStream.stream;
  }

  @override
  Widget buildResumeWidget(BuildContext context, PersonalInfo? model) {
    print('buildResumeWidget ${resumeComponentData.districts}');
    if (model != null) {
      birthdate = model.birthdate ?? '';
      isHijri = model.isHijri;
      cityId = model.cityId;
      idNumber = model.idNumber;
      name = model.name;
      email = model.email;
      isMale = model.isMale;
      length = model.length;
      weight = model.weight;
      districtId = model.districtId;
    }
    final enableToEditId = resumeComponentData.resume.haveInterView;
    print(
        'buildResumeWidget Personal $birthdate , ${model?.isHijri} , $idNumber');
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IgnorePointer(
              ignoring: enableToEditId!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(child: ProfileImagePicker(
                  //   imagePath: '',
                  //   onPickImage: (file) {
                  //  //   resumeBloc!.add(UpdateProfileImage(file));
                  //   },
                  // )),
                  buildTextFieldItem(
                    title: strings.name,
                    hint: '',
                    onChange: (String value) {
                      name = value;
                    },
                    initialValue: name,
                    icon: loadSvgIcon('profile'),
                    validator: (value) {
                      if (value!.isNullOrEmpty()) {
                        return strings.invalid_name;
                      }
                      if (!Validation.isArabicLetters(value)) {
                        return strings.invalid_ar_name;
                      }
                      if (!Validation.isFullName(value)) {
                        return strings.please_entry_valid_fullName;
                      }
                      return null;
                    },
                  ),
                  buildTextFieldItem(
                    initialValue: idNumber,
                    keyboardType: TextInputType.number,
                    hint: strings.enter_id_number,
                    readOnly: enableToEditId,
                    icon: loadSvgIcon('id'),
                    validator: (value) {
                      if (value!.isEmpty ) {
                        return strings.invalid_id_number;
                      }
                      return null;
                    },
                    onChange: (t) {
                      idNumber = AppUtils.replaceArabicNumber(t);
                      validate();
                    },
                    title: strings.id_number,
                  ),
                  buildTextFieldItem(
                    keyboardType: TextInputType.emailAddress,
                    icon: loadSvgIcon('email'),
                    hint: strings.enter_email,
                    initialValue: email,
                    validator: (value) {
                      if (!value!.isNullOrEmpty()) {
                        if (!Validation.isEmailValid(value)) {
                          return strings.invalid_email;
                        }
                      }
                      return null;
                    },
                    onChange: (t) {
                      email = t;
                      validate();
                    },
                    title: strings.email,
                  ),
                  SelectGender(
                      initValue: isMale == false ? Gender.Female : Gender.Male,
                      onSelect: (value) {
                        print('SelectGender ${value}');
                        isMale = value == Gender.Male;
                        validate();
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  buildBirthDateTextFieldItem(
                    context: context,
                    initialValue: birthdate,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFieldItem(
                          title: strings.length,
                          keyboardType: TextInputType.number,
                          hint: strings.enter_length,
                          initialValue: length?.toString(),
                          validator: (value) {
                            if (value!.isNullOrEmpty()) {
                              return strings.invalid_length;
                            }
                            return null;
                          },
                          onChange: (t) {
                            length = int.parse(t);
                            validate();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: buildTextFieldItem(
                          title: strings.weight,
                          keyboardType: TextInputType.number,
                          hint: strings.enter_weight,
                          initialValue: weight?.toString(),
                          validator: (value) {
                            if (value!.isNullOrEmpty()) {
                              return strings.invalid_weight;
                            }
                            return null;
                          },
                          onChange: (t) {
                            weight = int.parse(t);
                            validate();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildSelectCity(context),
            districtPicker(),
            const SizedBox(
              height: 20,
            ),
            militaryDisclosureCheckbox(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  iosDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return DatePicker(
            onSelectdate: (String date, bool isHijri) {
              birthdate = date;
              this.isHijri = isHijri;
              birthDateController.text = birthdate;
              print('iosDatePicker $birthdate');
              validate();
            },
          );
        });
  }

  cityPicker({required BuildContext context, required List<CityItem> cites}) {
    showAppModalBottomSheet(
      context: context,
      child: CityPickerWidget(
        cities: resumeComponentData.cities,
        onSelectCity: (CityItem city) {
          print('cityPicker onSelectCity $city');
          cityId = city.id;
          cityController.text = city.toLocal(isRtl());
          onFetchDistricts(cityId ?? 0);
          validate();
        },
      ),
      title: strings.select_city,
    );
  }

 Widget districtPicker(){
    return DistrictPickerStream(
      districtId: districtId ?? 0,
      districtsStream: resumeComponentData.districts,
      onSelectItem: (int id){
        districtId = id;
        validate();
      },
      onClickReload:() {
        onFetchDistricts(cityId ?? 0);
      },
    );
  }


  String selectedDate = '';
  final birthDateController = TextEditingController();
  Widget buildBirthDateTextFieldItem(
      {String? initialValue, required BuildContext context}) {
    print('buildBirthDateTextFieldItem $initialValue');
    birthDateController.text = initialValue ?? '';
    return buildTextFieldItemClickable(
        onTap: () {
          iosDatePicker(context);
        },
        controller: birthDateController,
        hint: strings.enter_birthdate,
        onChanged: (v) {
          print('buildBirthDateTextFieldItem $v');
          validate();
        },
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return strings.please_entry_birthdate;
          }
          return null;
        },
        title: strings.birthdate);
  }

  Widget buildSelectCity(BuildContext context) {
    print('buildSelectCity $cityId');
    if (cityId != null) {
      cityController.text = resumeComponentData.cities
              .firstWhereOrNull((element) => element.id == cityId)
              ?.toLocal(isRtl()) ??
          '';
    }

    return buildTextFieldItemClickable(
        onTap: () {
          cityPicker(context: context, cites: resumeComponentData.cities);
        },
        hint: strings.select_city,
        endIcon: loadSvgIcon('arrow_down'),
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return strings.invalid_city;
          }
          return null;
        },
        icon: loadSvgIcon('location'),
        controller: cityController,
        onChanged: (String value) {},
        title: strings.select_city);
  }

  Widget militaryDisclosureCheckbox() {
    return StreamBuilder<bool>(
      stream: approveCheck,
      initialData: false,
      builder: (context, snapshot) {
        return Container(
          decoration: const BoxDecoration(
              color: kWhiteF2, borderRadius: BorderRadius.all(Radius.circular(16))),
       //   margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 12),
          padding: const EdgeInsets.all(8),
          child: CheckboxListTile(
            value: snapshot.data==true,
            onChanged: (value) {
              approveCheckbox = value==true ;
              _approveCheck.sink.add(approveCheckbox);
              validate();
            },
            title: militaryServiceDisclosureText(),
          ),
        );
      }
    );
  }
}
