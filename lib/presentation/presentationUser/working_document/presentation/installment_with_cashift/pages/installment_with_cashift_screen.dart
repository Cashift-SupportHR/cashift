import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/buttons/row_buttons.dart';
import 'package:shiftapp/presentation/shared/components/checkbox/warning_check_box_widget.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';
import 'package:shiftapp/presentation/shared/components/texts/icon_double_text.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/divider/divider_vertical.dart';
import '../../../../resources/constants.dart';
import '../../../domain/entities/installment_with_cashift.dart';
import '../../terms_conditions_certificate_payment/pages/terms_conditions_certificate_payment_page.dart';
import '../widgets/installment_package_picker.dart';

class InstallmentWithCashiftScreen extends BaseStatelessWidget {
  final int paymentId;
  final List<InstallmentWithCashift> data;
  final Function(int) onAddInstallment;

  InstallmentWithCashiftScreen(
      {Key? key,
      required this.paymentId,
      required this.data,
      required this.onAddInstallment})
      : super(key: key);

  StreamStateInitial<bool> isAcceptStream = StreamStateInitial<bool>();
  StreamStateInitial<bool> isAcceptInitialStream = StreamStateInitial<bool>();

  InstallmentWithCashift item = InstallmentWithCashift();
  StreamStateInitial<InstallmentWithCashift> installmentWithCashiftStream =
      StreamStateInitial<InstallmentWithCashift>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: double.infinity,
      child: AppScaffold(
        bottomNavigationBar: rowButtons(),
        background: kWhite,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                header(),
                SizedBox(
                  height: 16,
                ),
                InstallmentPackagePicker(
                  items: data,
                  onSelectItem: (value) {
                    item = value;
                    installmentWithCashiftStream.setData(value);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                _CertificateDetails(
                    installmentWithCashiftStream: installmentWithCashiftStream),
                StreamBuilder<bool>(
                  stream: isAcceptInitialStream.stream,
                  builder: (context, snapshot) {
                    return WarningCheckBoxWidget(
                      value: snapshot.data ?? false,
                      activeColor: kPrimary,
                      text: strings.i_accept,
                      textClick: strings.copy_rights_title,
                      onTap: () async {
                        final isAgree = await Navigator.pushNamed(context,
                            Routes.termsConditionsCertificatePaymentPage,
                            arguments: paymentId);
                        if (isAgree != null && isAgree is bool) {
                          isAcceptStream.setData(isAgree);
                          isAcceptInitialStream.setData(isAgree);
                        }
                      },
                      onChanged: (value) {
                        isAcceptStream.setData(value ?? false);
                      },
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return IconText(
      icon: AppIcons.installment_by_opportunity,
      text: strings.discount_certificate_details,
      sizedBoxWidth: 10,
      textStyle: kTextSemiBold.copyWith(fontSize: 24, color: kYellow_00),
    );
  }

  Widget rowButtons() {
    return StreamBuilder<bool>(
        initialData: false,
        stream: isAcceptStream.stream,
        builder: (context, snapshot) {
          return RowButtons(
            onSave: snapshot.data == true
                ? () {
                    if (formKey.currentState!.validate()) {
                      onAddInstallment(item.id ?? 0);
                    }
                  }
                : null,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }
}

class _CertificateDetails extends BaseStatelessWidget {
  final StreamStateInitial<InstallmentWithCashift> installmentWithCashiftStream;

  _CertificateDetails({Key? key, required this.installmentWithCashiftStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle nameStyle = kTextMedium.copyWith(fontSize: 14, color: kGray_7F);
    return StreamBuilder<InstallmentWithCashift?>(
        stream: installmentWithCashiftStream.stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? const SizedBox()
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                      decoration: Decorations.boxDecorationBorder(
                          radius: 8, borderColor: kPrimary.withOpacity(0.3)),
                      child: FittedBox(
                        child: Row(
                          children: [
                            IconDoubleText(
                              icon: AppIcons.certificate_value,
                              name: strings.certificate_value,
                              nameStyle: nameStyle,
                              valueWidget: valueText(
                                  '${snapshot.data?.certificateCost ?? ''} ${strings.sr}'),
                            ),
                            DividerVertical(
                              color: kPrimary.withOpacity(0.3),
                              width: 1,
                              space: 10,
                            ),
                            IconDoubleText(
                              icon: AppIcons.num_installment,
                              name: strings.no_installment,
                              nameStyle: nameStyle,
                              valueWidget: valueText(
                                  snapshot.data?.installmentCount ?? ''),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                      decoration: Decorations.decorationOnlyRadius(
                          radius: 8, color: kWhiteOff),
                      child: Text(
                        snapshot.data?.textPercentageInstallment ?? '',
                        style: kTextSemiBold.copyWith(
                            fontSize: 20, color: kPrimary),
                      ),
                    ),
                  ],
                );
        });
  }

  Widget valueText(text) {
    return FittedBox(
      child: Text(
        text,
        style: kTextBold.copyWith(fontSize: 14, color: kGray_7F),
      ),
    );
  }
}
