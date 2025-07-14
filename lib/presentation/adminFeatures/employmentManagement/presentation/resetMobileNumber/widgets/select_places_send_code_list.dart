import 'package:flutter/material.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../presentationUser/resources/constants.dart';
import '../../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../domain/entities/notification_type_code.dart';

///  Created by harbey on 12/3/2023.
class SelectPlacesSendCodeList extends BaseStatelessWidget {
  final List<NotificationTypeCode> notificationTypeCodes;
  final Function(int) onSelect;
  SelectPlacesSendCodeList({
    Key? key,
    required this.notificationTypeCodes,
    required this.onSelect,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int id = 0;
    return Column(
      children: [
        Expanded(
          child: StatefulBuilder(
            builder: (context, setState) {
              return ListView.builder(
                itemCount: notificationTypeCodes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: Decorations.boxDecorationBorder(
                      color: Colors.white,
                      borderColor: kGray_86,
                    ),
                    child: CheckboxListTile(
                      title: Text(notificationTypeCodes[index].name ?? '', style: kTextMedium.copyWith(fontSize: 14, color: kBlack_33)),
                      visualDensity: VisualDensity.compact,
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: notificationTypeCodes[index].id == id,
                      checkboxShape: CircleBorder(),

                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      onChanged: (value) {
                        id = notificationTypeCodes[index].id ?? 0;
                        setState(() {});
                      },
                    ),
                  );
                },
              );
            }
          ),
        ),
        AppCupertinoButton(
          text: strings.save_button,
          margin: EdgeInsets.symmetric(vertical: 20),
          onPressed: () {
            onSelect(id);
          },
        ),
      ],
    );
  }
}
