import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/domain/entities/project_labels.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';

import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../../../common/components/radio/radio_grid_list.dart';

///  Created by harbey on 7/24/2023.
class AttendanceDepartureReport extends BaseStatelessWidget {
  final bool initialData;
  final ProjectLabels labels;
  final Function(bool) onChanged;

  AttendanceDepartureReport({
    Key? key,
    required this.initialData,
    required this.labels,
    required this.onChanged,
  }) : super(key: key);

  StreamStateInitial<String> descriptionStream =
      StreamStateInitial<String>();

  @override
  Widget build(BuildContext context) {
    onChangedStream(initialData);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      decoration: Decorations.shapeDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labels.chooseFinger ?? strings.attendance_departure_report,
            style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
          ),
          const SizedBox(height: 10),
          RadioGridList(
            items: [
              RadioItem(
                title: labels.fingerQR ?? '',
                value: 0.toString(),
              ),
              RadioItem(
                title: labels.fingerMobile ?? '',
                value: 1.toString(),
              ),
            ],
            groupValue: initialData == true ? '0' : '1',
            onChanged: (value) {
              print(value.value == '0');
              onChanged(value.value == '0');
              onChangedStream(value.value == '0');
            },
          ),
          StreamBuilder<String>(
            stream: descriptionStream.stream,
            builder: (context, snapshot) {
              return WarningWidget(warningText: snapshot.data ?? '', color: kRateBarIconColor);
            },
          ),
        ],
      ),
    );
  }

  onChangedStream(bool value) {
    descriptionStream.setData(value
        ? labels.descriptionofQRCode ?? ''
        : labels.descriptionofPhone ?? '');
  }
}
