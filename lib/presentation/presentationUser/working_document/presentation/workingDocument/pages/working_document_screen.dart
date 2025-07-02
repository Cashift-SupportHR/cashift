import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../resources/constants.dart';
import '../../../domain/entities/working_document.dart';
import '../widgets/advantages_working_document_list.dart';
import '../widgets/payment_methods_list.dart';


class WorkingDocumentScreen extends BaseStatelessWidget {
  final WorkingDocument data;
  WorkingDocumentScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          header(),
          AdvantagesWorkingDocumentList(
            data: data.benefits ?? [],
          ),
          SizedBox(
            height: 16,
          ),
          PaymentMethodsList(
            payments: data.payments ?? [],
          ),
        ],
      ),
    );
  }

  Widget header(){
    return IconText(
      icon: AppIcons.working_document,
      text: strings.advantages_freelancer_document,
      sizedBoxWidth: 10,
      textStyle: kTextSemiBold.copyWith(fontSize: 24, color: kYellow_00),
    );
  }
}
