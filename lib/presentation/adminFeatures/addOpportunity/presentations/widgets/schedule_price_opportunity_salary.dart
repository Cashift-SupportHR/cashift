import 'package:flutter/material.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../data/models/schedule_price_opportunity.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';

class SchedulePriceOpportunitySalary extends BaseStatelessWidget {
  final Function(bool)? onAllowEditPrice;
  final TextEditingController salaryController;
  final StreamState<SchedulePriceOpportunity?> schedulePriceOpportunityStream;
  bool isAllowEditPrice;
  SchedulePriceOpportunitySalary({Key? key, required this.onAllowEditPrice, required this.salaryController, required this.schedulePriceOpportunityStream, required this.isAllowEditPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('salaryController ${salaryController.text}');
    return  StreamBuilder<SchedulePriceOpportunity?>(
        stream: schedulePriceOpportunityStream.stream,
        builder: (context, snapshot) {
          if(snapshot.data != null){
            isAllowEditPrice = snapshot.data?.isAllowEditPrice ?? false;
          } else if (snapshot.hasError){
            print('isDioError ${snapshot.isDioError()}');
            isAllowEditPrice = false;
          }
          salaryController.text = snapshot.data?.salary.toString() ?? salaryController.text;
          print('isAllowEditPrice $isAllowEditPrice');
          onAllowEditPrice?.call(isAllowEditPrice);
          return BuildTextFieldItem(
            title: strings.opportunity_value,
            hintText: strings.type_opportunity_value,
            controller: salaryController,
            readOnly: true,
            onTap: isAllowEditPrice ? null : () {},
            validator: (value) {
              if (snapshot.error != null || value!.isEmpty) {
                return strings.enter_price_opportunity_message;
              }
              return null;
            },
          );
        }
    );
  }
}
