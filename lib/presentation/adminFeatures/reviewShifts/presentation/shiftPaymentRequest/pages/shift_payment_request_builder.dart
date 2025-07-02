import 'package:flutter/cupertino.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../data/models/complet_opportunity_dto.dart';
 import '../../../data/models/confirm_shift_payment_request.dart';
import '../bloc/shift_payment_request _cubit.dart';
import '../bloc/shift_payment_request_state.dart';
import 'shift_payment_request_body.dart';

class ShiftPaymentRequestBuilder
    extends BaseBlocWidget<ShiftPaymentRequestState, ShiftPaymentCubitCubit> {
  ShiftPaymentRequestBuilder(this.shift,this.onRefrash);

  Function ()?onRefrash;

  static Future push(BuildContext context,
      {required CompletedOpportunityData shift,required Function ()onRefrash}) {

    return showAppModalBottomSheet(
        context: context,

        child: ShiftPaymentRequestBuilder(shift,() => onRefrash( )),
        isDivider: false,
        radius: 16,
        topMargin: 60,
        padding: EdgeInsets.zero,
        titleWidget: Text(
            context.getStrings().order_status,
          style: kTextSemiBold.copyWith(fontSize: 18.sp, color: kPrimary),
          textAlign: TextAlign.center,
        ));
  }

  final CompletedOpportunityData shift;

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  onClickReload() {
    loadInitialData(context);
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchShiftPaymentRequiredData(shift);
  }

  @override
  Widget buildWidget(BuildContext context, ShiftPaymentRequestState state) {
    return ShiftPaymentRequestBody(
      requestState: state,
      onSubmit: (ConfirmShiftPaymentRequest params) {
        Navigator.pop(context, true);
        bloc.submitRequestConfirmation(params);
      },
    );
  }

  @override
  void onRequestSuccess(String? message) {
    showSuccessMessage(message!, onDismiss: () {

      Navigator.pop(context, true);
      onRefrash?.call( );
    });
  }
}
