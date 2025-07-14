import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/adminFeatures/terms_and_conditions/presentation/shared/widgets/term_and_condition_item.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../domain/entities/TermandCondition.dart';

class TermsAndConditionsScreen extends BaseStatelessWidget {
  List<TermandCondition> termsAndConditionsState;
  Function(int id) updateType;
  final Function(TermandCondition) onEdit;
  final Function(int id) onDelete;
  final int type;
  TermsAndConditionsScreen({
    required this.termsAndConditionsState,
    required this.onEdit,
    required this.updateType,
    required this.onDelete,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: termsAndConditionsState.length,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return TermsAndConditionsItem(
            type: type,
            termsAndConditions: termsAndConditionsState[index],
            onEdit: onEdit,
            updateType: updateType,
            onDelete: onDelete,
          );
        });
  }
}
