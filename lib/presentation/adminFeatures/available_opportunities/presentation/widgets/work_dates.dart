import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';

class WorkDates extends BaseStatelessWidget {
  final Opportunity opportunity;
  WorkDates({Key? key, required this.opportunity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 3, right: 20, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CustomChip(
              label: '${strings.beginning_work}'
                  ' : ${opportunity.workingStartDate != null ? DateFormatter.formatDate(DateTime.parse(opportunity.workingStartDate!), 'dd-MM-yyyy HH:mm a') : ''}'
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomChip(
                label: '${strings.end_work}'
                    ' : ${opportunity.workingEndDate != null ? DateFormatter.formatDate(DateTime.parse(opportunity.workingEndDate!), 'dd-MM-yyyy HH:mm a') : ''}'
            ),
          )
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  const CustomChip({Key? key, required this.label, this.labelStyle, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(label: FittedBox(child: Text(label)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: backgroundColor ?? kSilverTwo.withOpacity(0.14),
      labelStyle: labelStyle ?? kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 10),
    );
  }
}

