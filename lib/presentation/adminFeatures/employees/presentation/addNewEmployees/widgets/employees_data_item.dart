import 'package:flutter/material.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/presentation/adminFeatures/employees/data/models/constract_add_emp.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import '../../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
 import '../../../domain/entities/EmployeeData.dart';

class EmployeesDataItem extends BaseStatelessWidget {
  final EmployeeDataEntity data;
  final Function() onRefresh;
  EmployeesDataItem({required this.onRefresh,required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Row(
        children: [
          kBuildCircleImage(data.image ?? '', size: 50),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data.name ?? '',
                  style: kTextBold.copyWith(color: kBlack, fontSize: 16),
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
                      data.mobile ?? '',
                      style: kTextMedium.copyWith(color: kGrey62, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 71,
            height: 40,
            child: AppCupertinoButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.mainAddEmpPage,arguments: ConstractAddEmp(isEdit: false,empId: data.id ?? 0 ));
              },
              text: strings.add,
              elevation: 0,
              radius: BorderRadius.circular(5),
              padding: const EdgeInsets.symmetric(vertical: 11),
            ),
          ),
        ],
      ),
    );
  }
}
