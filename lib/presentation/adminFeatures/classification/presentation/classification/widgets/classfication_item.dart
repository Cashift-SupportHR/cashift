import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../common/components/image_builder.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/classification.dart';
import '../../addClassification/pages/add_classification_page.dart';

class ClassficationItem extends BaseStatelessWidget {
  final Classification data;
  int type;
  final Function(int id) onDelete;
  final Function() onRefresh;
  ClassficationItem({required this.data, required this.onRefresh, required this.onDelete, required this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        children: [
          Row(
            children: [
              kBuildCircleImage(data.icon ?? ''),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.nameAr ?? "",
                      style: kTextBold.copyWith(color: kPrimaryDark, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.nameEn ?? "",
                      style: kTextMedium.copyWith(color: kGrey62, fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              _OptionsMenuButton(
                type: type,
                onEdit: () {
                  AddClassificationPage.push(context, classification: data, onSuccess: () {
                    print('isTrue');
                    onRefresh();
                  });
                },
                onDelete: () {
                  onDelete(data.id ?? 0);
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          data.description == null || data.description == ''
              ? SizedBox()
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalDivider(
                        color: kYellow_00,
                        thickness: 1,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(child: Text(data.description ?? '', style: kTextMedium.copyWith(color: kBlack, fontSize: 14, fontWeight: FontWeight.w400))),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final Function() onEdit;
  final Function() onDelete;
  int type;
  _OptionsMenuButton({
    Key? key,
    required this.onEdit,
    required this.type,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5, top: 0, start: 5, bottom: 10),
        child: kLoadSvgInCirclePath(
          AppIcons.menu,
          height: 6,
          width: 6,
        ),
      ),
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit,
          titleStyle: titleStyle,
          isDivider: type != 2,
        ),
        if(type != 2)
        BuildPopupMenuItemContent(
                title: strings.update_status_unActive,
                titleStyle: titleStyle,
                isDivider: false,
              ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          onEdit();
        } else if (value == 1) {
          if (type == 1) onDelete();
        }
      },
    );
  }
}
