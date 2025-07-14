import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';

///  Created by harbey on 7/17/2023.
class CustomerReviewsWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: Decorations.shapeDecoration(radius: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.customer_reviews,
            style: kTextRegular.copyWith(color: kRateBarIconColor, fontSize: 14),
          ),
          SizedBox(height: 14),
          SizedBox(
            height: 200,
            child: Swiper(
              itemCount: 5,
              // index: snapshot.data!.length - 1,
              itemWidth: double.infinity,
              itemBuilder: (BuildContext context, int index) {
                return _CustomerReviewsSliderItem();
              },
              pagination: SwiperPagination(),
              viewportFraction: 0.95,
              scale: 0.8,
              autoplay: false,
              autoplayDisableOnInteraction: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomerReviewsSliderItem extends StatelessWidget {
  const _CustomerReviewsSliderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'مجتهد في عمله ومتعاون ويجيد الشغل تحت ضغط ',
          textAlign: TextAlign.center,
          style: kTextMedium.copyWith(fontSize: 14, color: kBlack_00),
        ),
        SizedBox(height: 20),
        Text(
          'آدم أحمد محمود',
          textAlign: TextAlign.center,
          style: kTextMedium.copyWith(fontSize: 12, color: kYellow_00),
        ),
        SizedBox(height: 4),
        Text(
          'CEO Of Support',
          textAlign: TextAlign.center,
          style: kTextRegular.copyWith(fontSize: 10, color: kGreen_3D),
        ),
      ],
    );
  }
}

