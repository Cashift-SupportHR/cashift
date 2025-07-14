import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import '../../../../../main_index.dart';
 import '../bloc/overview_state.dart';
import '../widgets/current_date_widget.dart';
import '../widgets/job_offers_sliders.dart';
import '../widgets/opportunity_slider.dart';

class PreLoginWidget extends BaseStatelessWidget {
  final OverviewPreLoginState state;

  PreLoginWidget({required this.state});
  @override
  Widget build(BuildContext context) {
    return buildPreLogin(context);
  }

  Widget buildPreLogin(BuildContext context) {
    print('buildPreLogin $state');
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CurrentDateWidget(),
        getCountOfJobsWidget(state.numOfJob()),
        const SizedBox(
          height: 16,
        ),
        JobOffersSlidersWidget(
          jobOffersSliders: state.jobOffersSliders ,
          onApplyJobNow: (id){
            Navigator.pushNamed(context,  Routes.login);
          },
        ),
          const SizedBox(
          height: 16,
        ),

        OpportunitySlider(
          showViewAllButton: true,
            stream: state.offers.stream,
            onRefresh: () {},
            special: false, name: strings.all_jobs,
          onCheckCertificateJob: (id) {
            Navigator.pushNamed(context,  Routes.login);
          },
        ),
      ],
    );
  }

  Widget getCountOfJobsWidget(Stream<int> numOfJob) {
    return StreamBuilder<int>(
      stream: numOfJob,
      builder: (context, snapshot) {
        return Text(
          (snapshot.data??0) >0 ?'${snapshot.data} ${strings.jobs_in_waiting} ':'',
          style: kTextRegular.copyWith(fontSize: 12, color: kSilverTwo),
        );
      }
    );
  }
}
