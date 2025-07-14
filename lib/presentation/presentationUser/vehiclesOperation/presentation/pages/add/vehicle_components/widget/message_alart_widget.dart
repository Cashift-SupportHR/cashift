
import 'package:flutter/material.dart';
 import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/decorations/decorations.dart';

import '../../../../../../resources/colors.dart';

class MessageAllartWidget extends BaseStatelessWidget {



  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 70,
      padding: EdgeInsets.all(7),
      decoration:
      Decorations.decorationOnlyRadius(color: kPrimary.withOpacity(.2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              strings.vehicle_note,
              style: kTextRegular.copyWith(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
