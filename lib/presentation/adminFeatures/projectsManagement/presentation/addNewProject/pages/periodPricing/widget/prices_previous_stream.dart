import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/domain/entities/last_price.dart';

import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/texts/underline_text.dart';

class PricesPreviousStream extends BaseStatelessWidget {
  StreamStateInitial<List<LastPrice>?> pricesPreviousStream;

  PricesPreviousStream({required this.pricesPreviousStream});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LastPrice>?>(
        stream: pricesPreviousStream.stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? SizedBox()
              : Container(
                  color: kGray_F5,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnderlineText(
                        text: strings.last_pricing,
                        fontSize: 16,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textValue(
                                    text: strings.the_salary,
                                    value: snapshot.data?[index].salary.toString() ?? '',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: textValue(
                                            text: strings.from,
                                            value: snapshot.data?[index].fromDay.toString() ?? '',
                                          ),
                                        ),
                                        Expanded(
                                          child: textValue(
                                            text: strings.to_,
                                            value: snapshot.data?[index].toDay.toString() ?? '',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                        separatorBuilder: (context, index) {
                            return  Divider(
                              color: Color(0xffB3B3B3),
                              height: .5,
                            );
                        }
                          ),
                    ],
                  ),
                );
        });
  }

  textValue({
    required String text,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          "${text}  :  ",
          style: kTextMediumPrimary,
        ),
        Expanded(
            child: Text(
          value,
          style: kTextMediumPrimary.copyWith(color: kPaleGray72),
        ))
      ],
    );
  }
}
