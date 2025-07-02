import 'package:flutter/material.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/free_lance_info.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/free_lance_info_params.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/presentation/shared/components/underline_widget.dart';

import '../../../../../../core/utils/app_utils.dart';
import '../../../../../presentationUser/resources/validation.dart';

class AddEmployeeForOpportunityWidget extends BaseStatelessWidget {
  final int opportunityId;
  final Function(String phone) onAddEmployee;
  final Function(List<FreeLanceInfoParams>) onSaveEmployees;
  final StreamStateInitial<FreeLanceInfo?> employeeFreeLanceInfoStream;

  AddEmployeeForOpportunityWidget({Key? key, required this.opportunityId, required this.onAddEmployee, required this.onSaveEmployees, required this.employeeFreeLanceInfoStream})
      : super(key: key);

  StreamState<List<FreeLanceInfo>> listFreeLanceInfoStream = StreamStateInitial();
  List<FreeLanceInfo> listFreeLanceInfo = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.mobile_number,
                style: kTextLabel.copyWith(color: kPrimary),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: StreamBuilder<FreeLanceInfo?>(
                        stream: employeeFreeLanceInfoStream.stream,
                        builder: (context, snapshot) {
                          print('snapshot.data ${snapshot.data}');
                          if (snapshot.data != null) {
                            listFreeLanceInfo.add(snapshot.data!);
                            // remove duplicate
                            listFreeLanceInfo = listFreeLanceInfo.toSet().toList();
                            listFreeLanceInfoStream.setData(listFreeLanceInfo);
                            _phoneController.clear();
                          }
                          return MaterialTextField(
                            inputDecoration: kTextFieldDecorationLessRadius,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            onTap: () {
                              employeeFreeLanceInfoStream.setError('');
                            },
                            validator: (value) {
                              if (value!.isNullOrEmpty()) {
                                return strings.please_entry_phone;
                              } else if (!Validation.isValidPhone(AppUtils.replaceArabicNumber(value))) {
                                return strings.invalid_phone;
                              } else if (listFreeLanceInfo.any((element) => element.phoneNumber == value)) {
                                return strings.employee_already_added;
                              } else if (snapshot.error != null && snapshot.error.toString().isNotEmpty) {
                                return strings.employee_not_found;
                              }

                              return null;
                            },
                          );
                        }),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kGrey_EB),
                    ),
                    child: IconButton(
                      onPressed: () => onSearchAction(context),
                      icon: const Icon(Icons.add_circle_outline, color: kPrimary),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: kGrey_EB,
                thickness: 1,
                height: 50,
              ),
              Text(
                strings.menu_applicants,
                style: kTextBold.copyWith(color: kPrimary),
              ),
              const UnderlineWidget(),
              const SizedBox(
                height: 20,
              ),
              MenuEmployeeList(
                freeLanceInfo: listFreeLanceInfoStream,
              ),
              const SizedBox(
                height: 20,
              ),
              AppCupertinoButton(
                text: strings.save_button,
                radius: BorderRadius.circular(8),
                onPressed: () {
                  onAddEmployeeAction(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSearchAction(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      print('phone: ${_phoneController.text.trim()}');
      onAddEmployee(_phoneController.text.trim());
      // cancel focus text field
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  onAddEmployeeAction(BuildContext context) {
    if (listFreeLanceInfo.isNotEmpty) {
      listFreeLanceInfo;
      onSaveEmployees(listFreeLanceInfo
          .map((e) => FreeLanceInfoParams(
                freeLanceId: e.id,
                oppId: opportunityId,
                isWeb: e.isAssign,
              ))
          .toList());
    }
  }
}

class MenuEmployeeList extends BaseStatelessWidget {
  final StreamState<List<FreeLanceInfo>> freeLanceInfo;

  MenuEmployeeList({Key? key, required this.freeLanceInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    strings.name,
                    style: kTextLabel.copyWith(color: kPrimary),
                  ),
                ),
                Expanded(
                  child: Text(
                    strings.mobile_number,
                    style: kTextLabel.copyWith(color: kPrimary),
                  ),
                ),
                const SizedBox(
                  width: 28,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<List<FreeLanceInfo>>(
                  stream: freeLanceInfo.stream,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: MenuEmployeeItem(
                                      title: snapshot.data![index].name ?? '',
                                    ),
                                  ),
                                  Expanded(
                                    child: MenuEmployeeItem(
                                      title: snapshot.data![index].phoneNumber ?? '',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      snapshot.data!.removeAt(index);
                                      freeLanceInfo.setData(snapshot.data!);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        color: kRed,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : const SizedBox();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
//  MenuEmployeeForOpportunityDetails

class MenuEmployeeItem extends StatelessWidget {
  final String title;

  const MenuEmployeeItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Divider(
            color: kWarmGrey.withOpacity(0.17),
            thickness: 1,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: kTextRegular.copyWith(color: kPrimary, fontSize: 12),
        ),
      ],
    );
  }
}
