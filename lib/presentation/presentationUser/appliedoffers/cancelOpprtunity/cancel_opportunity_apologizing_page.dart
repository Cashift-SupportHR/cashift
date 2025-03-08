import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../domain/entities/appliedOffers/cancel_opportunity_apologizing.dart';
import '../../../shared/components/decorations/decorations.dart';
import '../../../shared/components/helper_widgets.dart';
import '../../resources/colors.dart';
import 'bloc/cancel_opportunity_apologizing_bloc.dart';
import 'opportunity_apologizing_widget.dart';

class CancelOpportunityApologizingPage extends BaseBlocWidget<
    Initialized<CancelOpportunityApologizing>, CancelOpportunityApologizingCubit> {
  final int id;
  final Function(String reason) onConfirm;
  CancelOpportunityApologizingPage({Key? key, required this.id, required this.onConfirm}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData(id);
  }


  @override
  Widget buildWidget(
      BuildContext context, Initialized<CancelOpportunityApologizing> state) {
    return OpportunityApologizingWidget(
      data: state.data,
      onConfirm: (reason) {
        onConfirm(reason);
      },
    );
  }


  static  showCancelOpportunityApologizing(BuildContext context , {required int id, required Function(String reason) onConfirm}) {

    showAppModalBottomSheet(
      context: context,
    //  title: context.getStrings().cancel_shift_title,
      isDivider: false,
      isCloseButton: false,
      headerWidget: Container(
        height: 6,
        width: 150,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: Decorations.decorationOnlyRadius(radius: 20, color: kPrimary),
      ),
      child: CancelOpportunityApologizingPage(
        id: id,
        onConfirm: (String reason) {
            onConfirm(reason);
        }
      ),
    );
  }
}
