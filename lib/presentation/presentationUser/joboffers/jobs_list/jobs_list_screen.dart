import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/job_offer_item_widget.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../core/services/routes.dart';
import '../job_offer_details/job_offer_details_page.dart';


class JobsListScreen extends BaseStatelessWidget {
  final List<JobOfferDto> offers;
  final Function onApplyOffer;
  final bool? special;
  JobsListScreen(this.offers, {required this.onApplyOffer, this.special});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offers.length,
   itemExtent: 300,
      shrinkWrap: true, itemBuilder: (BuildContext context, int index) {
        return   JobOfferItemWidget(offers[index], special: special,listView: true, onClickApply: () {
          navigateToDetails(context, offers[index].id!);
         // onApplyOffer();
        });
    },
    );
  }
  navigateToDetails(BuildContext context,int jobId) =>  Navigator.pushNamed(
      context, Routes.jobOfferDetails,
      arguments:
      JobOfferDetailsPageArgs( jobId));
}
