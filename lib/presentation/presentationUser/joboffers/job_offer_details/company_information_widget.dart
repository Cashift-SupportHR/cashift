import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shiftapp/common/domain/entities/jobs/job_details.dart';
import 'package:shiftapp/presentation/shared/components/row_info_builder.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/jobs_slider_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import 'package:shiftapp/presentation/shared/components/map/map_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/base_widget.dart';

class CompanyInformationWidget extends BaseWidget {
  final JobDetail jobDetail;
  final ScrollController? scrollController;
  CompanyInformationWidget(this.jobDetail, {Key? key, this.scrollController})
      : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final company = jobDetail.companyInfo;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 16,
            ),
            buildInfoRows(),
            const SizedBox(
              height: 16,
            ),
            buildDescription(company.description),
            const SizedBox(
              height: 16,
            ),
            buildAddressWidget(company.location(), company.address),
            const SizedBox(
              height: 24,
            ),
            buildCompanyOtherJobs(),
            const SizedBox(
              height: 8,
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
        rowLabel(strings.company_description),
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
                title: projectAddress!,
              )),
        )
      ],
    );
  }

  Widget buildInfoRows() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: CompanyRowsBuilder(
                strings: strings, companyInfo: jobDetail.companyInfo)
            .rowsWidgets());
  }

 Widget buildCompanyOtherJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         MaterialText(
          '${strings.company_jobs} (${jobDetail.availableJob?.length} ${strings.job})',
          endIcon: Text(strings.view_all,style: kTextRegular.copyWith(fontSize: 12,color: kBrownishGrey),),
          style: kTextSemiBold.copyWith(fontSize: 16.sp),
          mathWidth: true,
           margin: EdgeInsets.only(bottom: 16),
        )

        ,JobsSliderWidget(
          offers: jobDetail.availableJob ?? [],
          onApplyOffer: (id) {},
        )
      ],
    );
  }
}
