import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../data/models/index.dart';
import '../widgets/employees_certificates_item.dart';
class EmployeesCertificatesScreen extends StatelessWidget {
  final List<EmployeeCertificate> data;
  final Function(int) onShareEmployeeCertificate;
  final Function(int) onDownLoadEmployeeCertificate;
  const EmployeesCertificatesScreen({Key? key, required this.data, required this.onDownLoadEmployeeCertificate, required this.onShareEmployeeCertificate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap:   true,
        padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 16),
        itemBuilder: (context, index) {
          return  EmployeesCertificatesItem(
            onShareEmployeeCertificate: (){
              onShareEmployeeCertificate(data[index].id ?? 0);
            },
            item: data[index],
            onDownLoadEmployeeCertificate: () {
              onDownLoadEmployeeCertificate(data[index].id ?? 0);
            },
          );
        },
      ),
    );
  }
}
