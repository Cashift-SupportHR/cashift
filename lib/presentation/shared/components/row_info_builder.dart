import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/models/attendance/attendance_shift_dto.dart';
import 'package:shiftapp/common/domain/entities/jobs/company_info.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import 'material_text.dart';


class RowInfoItem {
  final String label;
  final String value;
  RowInfoItem(this.label, this.value);
}

abstract class RowsBuilder {
  final AppLocalizations strings;

  RowsBuilder({required this.strings});

  List<RowInfoItem> _rows();

  List<Widget> rowsWidgets() {
    return _rows()
        .map((e) => _buildJobInfoItem(
              label: e.label,
              value: e.value,
            ))
        .toList();
  }

  Widget _buildJobInfoItem({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialText(
          label,
          mathWidth: true,
          padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8),
          endIcon: Text(
            value,
            style: kTextMedium.copyWith(fontSize: 12, color: kAlmostBlack),
          ),
          style: kTextRegular.copyWith(color: kDarkGrey, fontSize: 12),
        ),
        const Divider()
      ],
    );
  }
}

class JobRowsBuilder extends RowsBuilder {
  final JobOfferDto job;

  JobRowsBuilder({required this.job, required AppLocalizations strings})
      : super(strings: strings);

  @override
  List<RowInfoItem> _rows() {
    var currency = strings.sar;
    List<RowInfoItem> rows = [];
    rows.add(RowInfoItem(strings.career_field, job.jobName ?? ''));
    rows.add(RowInfoItem(
        strings.specialization, job.jobRequirements?.specialization ?? ''));

    if(job.showPrice == true){
      rows.add(RowInfoItem(strings.salary, '${job.salary ?? ''} $currency'));
    }
    rows.add(RowInfoItem(strings.gender, job.jobRequirements?.gender ?? ''));
    rows.add(RowInfoItem(strings.qualification, job.qualificationName ?? ""));
    if(job.showQuantity == true){
      rows.add(RowInfoItem(strings.required_number, job.requirmentCount.toString()));
    }
    rows.add(RowInfoItem(strings.remaining_number, job.actualNumber.toString()));
    rows.add(RowInfoItem(strings.work_location, job.projectAddress ?? ''));
    rows.add(RowInfoItem(strings.start_date, job.workingDateString()));
    rows.add(RowInfoItem(strings.end_date, job.endDateString()));
    rows.add(RowInfoItem(strings.working_time, '${strings.from} ${job.workingTimeString()} ${strings.to} ${job.endTimeString()}'));
    rows.add(RowInfoItem(strings.attendance_method, job.isFingerPrint ?? ''));
    return rows;
  }
}
class SpecialJobRowsBuilder extends RowsBuilder {
  final JobOfferDto job;

  SpecialJobRowsBuilder({required this.job, required AppLocalizations strings})
      : super(strings: strings);

  @override
  List<RowInfoItem> _rows() {
    var currency = strings.sar;
    List<RowInfoItem> rows = [];
    rows.add(RowInfoItem(strings.career_field, job.jobName ?? ''));
    if(job.showPrice == true){
      rows.add(RowInfoItem(strings.salary, '${job.salary ?? ''} $currency'));
    }
    rows.add(RowInfoItem(strings.gender, job.jobRequirements?.gender ?? ''));
    rows.add(RowInfoItem(strings.qualification, job.qualificationName ?? ""));
    if(job.showQuantity == true){
      rows.add(RowInfoItem(strings.required_number, job.requirmentCount.toString()));
    }
    rows.add(RowInfoItem(strings.work_location, job.projectAddress ?? ''));
    rows.add(RowInfoItem(strings.attendance_method, job.isFingerPrint ?? ''));
    return rows;
  }
}

class CompanyRowsBuilder extends RowsBuilder {
  final CompanyInfo companyInfo;

  CompanyRowsBuilder(
      {required this.companyInfo, required AppLocalizations strings})
      : super(strings: strings);

  @override
  List<RowInfoItem> _rows() {
    List<RowInfoItem> rows = [];
    rows.add(RowInfoItem(strings.company_name, companyInfo.companyName ?? ''));
    rows.add(RowInfoItem(strings.field_type, companyInfo.fieldType ?? ''));
    rows.add(RowInfoItem(strings.section, companyInfo.section ?? ''));
    return rows;
  }
}

class ShiftRowsBuilder extends RowsBuilder {
  final AppliedOffer job;

  ShiftRowsBuilder({required this.job, required AppLocalizations strings})
      : super(strings: strings);

  @override
  List<RowInfoItem> _rows() {
    var currency = strings.sar;
    List<RowInfoItem> rows = [];
    rows.add(RowInfoItem(strings.career_field, job.jobName ?? ''));
    // rows.addopportunityemployee(RowInfoItem(strings.specialization,job.specializtion??''));
    rows.add(RowInfoItem(strings.salary, '${job.salary ?? ''} $currency'));
    rows.add(RowInfoItem(strings.work_location, job.address ?? ''));
    rows.add(RowInfoItem(strings.start_date, job.workingDateString() ?? ''));
    rows.add(RowInfoItem(strings.end_date, job.endDateString()));
    rows.add(RowInfoItem(strings.working_time,
        '${strings.from} ${job.startTime()} ${strings.too} ${job.finishTime()}'));
    rows.add(RowInfoItem(strings.attendance_method,
        job.requiredQr() ? strings.qr_scanner : strings.location));
    return rows;
  }
}

class AttendanceInfoRowsBuilder extends RowsBuilder{
  final AttendanceShiftDto shift ;
  AttendanceInfoRowsBuilder({required AppLocalizations strings ,required this.shift }) : super(strings: strings);

  @override
  List<RowInfoItem> _rows() {
   return[
     RowInfoItem(strings.job, shift.jobName??''),
     RowInfoItem(strings.company_name, shift.projectName??''),
     RowInfoItem(strings.start_date, shift.shiftFrom??''),
     RowInfoItem(strings.end_date, shift.shiftTo??''),
     RowInfoItem(strings.status, shift.employeeChar??''),
   ];
  }

}