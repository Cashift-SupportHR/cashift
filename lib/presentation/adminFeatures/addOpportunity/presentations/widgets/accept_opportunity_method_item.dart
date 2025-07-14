import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../common/components/decorations/decorations.dart';
import '../../domain/entities/employee_opportunity_type.dart';

class AcceptOpportunityMethodItem extends StatelessWidget {
  final EmployeeOpportunityType? data;
  const AcceptOpportunityMethodItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsetsDirectional.all(10),
        decoration: Decorations.boxDecorationBorder(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            kBuildImage(data?.icon ?? '', size: 80, border: 0,showFullImage:false,),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text(data?.name ?? '', style: kTextSemiBold.copyWith(fontSize: 22, color: kBlack))),
                  SizedBox(height: 10),
                  Flexible(child: Text(data?.description ?? '', style: kTextRegular.copyWith(fontSize: 12, color: kGray_64))),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: kPrimary, size: 18),
          ],
        )
      ),
    );
  }
}

