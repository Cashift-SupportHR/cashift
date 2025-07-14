import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/common/domain/entities/jobs/job_details.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import 'package:shiftapp/presentation/shared/components/map/map_widget.dart';
import 'package:shiftapp/presentation/shared/components/row_info_builder.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/base_widget.dart';
import '../../appliedoffers/details/widgets/tasksAndDuties.dart';
import '../widgets/uniform_list_job.dart';

class JobInformationWidget extends BaseWidget {
  final JobDetail jobDetail;
  final ScrollController? scrollController;
  JobInformationWidget(this.jobDetail, {Key? key, this.scrollController})
      : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final job = jobDetail.jobOffer;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildDescription(job.description),
            const SizedBox(
              height: 16,
            ),
            rowLabel(strings.offer_terms),
            const SizedBox(
              height: 16,
            ),
            buildInfoRows(job),
            UniformJobList(
              listJobUniForm: jobDetail.jobOffer.listJobUniForm ?? [],
            ),
            (jobDetail.conditionName?.length==0 || jobDetail.conditionName == null)?SizedBox(): rowLabel(strings.tasks_and_duties),
              (jobDetail.conditionName?.length==0 || jobDetail.conditionName == null)?SizedBox(): const SizedBox(height: 5,),
            (jobDetail.conditionName?.length==0 || jobDetail.conditionName == null)?SizedBox():
              TasksAndDuties(
                tasksAndDuties: jobDetail.conditionName ?? [],
              ),
            buildAddressWidget(job.location(), job.projectAddress),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescription(String? description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowLabel(strings.offer_description),
        Text(
          description ?? 'No Description',
          style: kTextRegular.copyWith(color: kPurplishGrey, fontSize: 12),
        )
      ],
    );
  }

  Widget rowLabel(String label) {
    return Text(
      label,
      style: kTextSemiBold.copyWith(fontSize: 16.sp),
    );
  }

  Widget buildAddressWidget(LatLng location, String? projectAddress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.location,
          style: kTextSemiBold.copyWith(fontSize: 16.sp),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          projectAddress ?? '',
          style: kTextRegular.copyWith(color: kPurplishGrey, fontSize: 12),
        ),
        Container(
          height: 150,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: StaticMapWidget(
                location: location,
                title: projectAddress ?? '',
              )),
        )
      ],
    );
  }

  Widget buildInfoRows(JobOfferDto job) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: jobDetail.special == true
            ? SpecialJobRowsBuilder(job: job, strings: strings).rowsWidgets()
            : JobRowsBuilder(strings: strings, job: job).rowsWidgets());
  }
}
