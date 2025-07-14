import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/job_offer_item_widget.dart';


import '../../../../common/components/base/base_widget.dart';

class JobsSliderWidget extends BaseWidget{
  final List<JobOfferDto> offers ;
  final Function(int) onApplyOffer ;
  final bool  ? special ;
  JobsSliderWidget({Key? key, required this.offers , required this.onApplyOffer , this.special}) : super(key: key);
  @override
  Widget buildWidget(BuildContext context) {
    return SizedBox(
      height: 240,
      child: PageView.builder(
          pageSnapping: true,
          controller: PageController(
            viewportFraction: 0.9,
            initialPage: 0,
          ),
          itemCount: offers.length,
          itemBuilder: (con, pos) {
            final jobOffer = offers[pos];
            return JobOfferItemWidget(
              jobOffer,
              special: special,
              onClickApply: () {
                onApplyOffer( jobOffer.id ?? 0);
              },
            );
          }),
    ) ;
  }

}

