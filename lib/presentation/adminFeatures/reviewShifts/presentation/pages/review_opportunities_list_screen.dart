import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_stateful_widget.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/search_widget.dart';
import '../../data/models/complet_opportunity_dto.dart';
import '../../data/models/completed_opportunity_dto.dart';
import '../shiftPaymentRequest/pages/shift_payment_request_builder.dart';
import '../widgets/review_opportunity_item_widget.dart';

class ReviewOpportunitiesListScreen extends BaseStatelessWidget {
  final List<CompletedOpportunityData> data;
  final bool? selectable;
  final Function() onUpdate;
  ReviewOpportunitiesListScreen(
      {required this.data, this.selectable, required this.onUpdate});
  List<int> selectedIndexes = [];
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ReviewOpportunityItemWidget(
              opportunity: data[index],
              selectable: selectable,
              checked: true,
              onChecked: (bool checked) {
                setState(() {
                  if (checked == true) {
                    selectedIndexes.add(index);
                  } else {
                    selectedIndexes.remove(index);
                  }
                });
                //  setChecked(checked, item.id!);
              },
              onSubmit: (CompletedOpportunityData shift) {
                navigateToConfirm(shift, context);
              },
            );
          });
    });
  }

  Future<void> navigateToConfirm(
      CompletedOpportunityData shift, context) async {
    await ShiftPaymentRequestBuilder.push(
      context,
      shift: shift,
      onRefrash: () {
        onUpdate();
      },
    );
  }
}
