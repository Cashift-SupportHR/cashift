import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/jobs_list/jobs_list_screen.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/slide_animation.dart';

import '../job_offer_details/job_offer_details_page.dart';

class JobsPageModel {
  final String title;
  final List<JobOfferDto> offers;
  final bool? special;
  JobsPageModel(this.title, this.offers, {this.special});
}

class JobsListPage extends BaseStatelessWidget {

  @override
  Widget build(BuildContext context) {
    final args = getArguments<JobsPageModel>(context)!;
    return AppScaffold(
        title: args.title,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SlideAnimationWidget(
            child: JobsListScreen(
              args.offers,
              special: args.special,
              onApplyOffer: () {

                //Navigator.pop(context, true);
              },
            ),
          ),
        ));
  }

}
