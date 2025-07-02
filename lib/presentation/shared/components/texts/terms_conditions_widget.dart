import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/decorations/decorations.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../presentationUser/common/stream_data_state.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../base_stateless_widget.dart';
import '../icons/icon_text.dart';
import '../stream/stream_data_state_widget.dart';

///  Created by harbey on 9/28/2024.
class TermsConditionsWidget extends BaseStatelessWidget {
  final String? title;
  final StreamDataState<List<CommonListItem>?>? dataStream;
  final List<CommonListItem>? data;

  TermsConditionsWidget({Key? key, this.title, this.data, this.dataStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.boxDecorationBorder(),
      child: Column(
        children: [
          titleTermsConditions(),
          dataStream != null ? streamTermsConditionsList(context) :
          TermsConditionsList(
            data: data ?? [],
          ),
        ],
      ),
    );
  }

  streamTermsConditionsList(BuildContext context){
    return StreamDataStateWidget<List<CommonListItem>?>(
        stream: dataStream!,
        builder: (context, data) {
        return TermsConditionsList(
          data: data ?? [],
        );
      }
    );
  }

  Widget titleTermsConditions(){
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
      child: IconText(
        icon: AppIcons.working_document,
        text: title ?? strings.copy_rights_title,
        sizedBoxWidth: 10,
        textStyle: kTextSemiBold.copyWith(fontSize: 24, color: kYellow_00),
      ),
    );
  }
}


class TermsConditionsList extends StatelessWidget {
  final List<CommonListItem> data;

  const TermsConditionsList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return TermConditionItem(
          title: data[index].name ?? '',
        );
      },
    );
  }
}

class TermConditionItem extends StatelessWidget {
  final String title;

  const TermConditionItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        kTextRegular.copyWith(fontSize: 14, color: kBlack.withOpacity(0.7));
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4, start: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: textStyle,
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 3),
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
