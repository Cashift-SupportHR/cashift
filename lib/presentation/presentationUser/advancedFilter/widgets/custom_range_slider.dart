import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shiftapp/presentation/presentationUser/advancedFilter/widgets/text_slider_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../resources/constants.dart';

class CustomRangeSlider extends BaseStatelessWidget {
  final int? start;
  final int? end;
  final void Function(int, int)? onChanged;

  CustomRangeSlider({Key? key, this.onChanged, this.start, this.end}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SfRangeValues _values = SfRangeValues(
      start ?? 20,
      end ?? 900,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.opportunity_price,
            style: kTextSemiBold.copyWith(color: kPrimary),
          ),
          const SizedBox(
            height: 10,
          ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              strings.minimum,
              style: kTextSemiBold.copyWith(color: kBattleShipGrey2, fontSize: 16),
            ),
            Text(
              strings.maximum,
              style: kTextSemiBold.copyWith(color: kBattleShipGrey2, fontSize: 16),
            ),
          ],
        ),
          StatefulBuilder(builder: (context, setState) {
            return SfRangeSliderTheme(
              data: SfRangeSliderThemeData(
                thumbStrokeWidth: 2.5,
                thumbStrokeColor: kAlmostBlack,
                thumbColor: kWhite,
                tickSize: const Size(0, 0),
                activeTrackHeight: 4,
                inactiveTrackHeight: 2,
                // tooltipBackgroundColor: kWhite,
                // tooltipTextStyle: kTextRegular.copyWith(color: kAlmostBlack),
              ),
              child: SfRangeSlider(
                min: 20,
                max: 2000,
                values: _values,
                interval: 2000,
                enableTooltip: true,
                tooltipShape: const SfPaddleTooltipShape(),
                numberFormat: NumberFormat('#'),
                onChanged: ( value) {
                  _values = value;
                  onChanged?.call(value.start.toInt() , value.end.toInt());
                  setState(() {});
                },
              ),
            );
          }),
          TextSliderWidget(
            minimum: '20 '  ,
            maximum: '2000 ',
          ),
        ],
      ),
    );
  }
}


