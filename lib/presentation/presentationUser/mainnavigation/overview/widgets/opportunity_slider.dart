import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/joboffers/jobs_list/jobs_list_page.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/widgets/jobs_slider_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/error_handler_widget.dart';

import '../../../../../main_index.dart';
import '../../../../../common/components/loading_widget.dart';


class OpportunitySlider extends BaseStatelessWidget {
  final Stream<List<JobOfferDto>?> stream;
  final Function onRefresh;
  final String name;
  final Widget? header;
  final bool? showPlaceHolder;
  final bool showViewAllButton;
  final bool? special;
  final Function(int) onCheckCertificateJob;
  OpportunitySlider(
      {required this.stream,
      required this.onRefresh,
      this.header,
      this.showPlaceHolder,
      required this.showViewAllButton,
      required this.special,
      required this.name,
      required this.onCheckCertificateJob
      });
  Widget buildOffersSliderSection() {
    return StreamBuilder<List<JobOfferDto>?>(
        stream: stream,
        builder: (context, snapshot) {
          final offers = snapshot.data;
          if (showPlaceHolder == true) {
            print('StreamBuilder Offer ${snapshot.error}');
            return Column(
              children: [
                special == true ? headerWidget(context, offers ?? []) : SizedBox(),
                snapshot.hasError
                    ? errorWidget(snapshot.error!)
                    : snapshot.data != null
                        ? slider(offers ?? [])
                        : const LoadingView(
                            height: 180,
                          )
              ],
            );
          } else {
            return snapshot.hasError||offers?.isEmpty==true
                ? snapshot.error?.emptyListException() == true ||offers?.isEmpty==true
                    ? Container()
                    : errorWidget(snapshot.error!)
                : Column(
                    children: [
                      special == true
                          ? headerWidget(context, offers ?? [])
                          : SizedBox(),
                      snapshot.data != null
                          ? slider(offers ?? [])
                          : LoadingView(
                              height: 180,
                            )
                    ],
                  );
          }
        });
  }

  Widget slider(List<JobOfferDto> offers) {
    return JobsSliderWidget(
      offers: offers,
      special: special,
      onApplyOffer: (id) {
        onCheckCertificateJob(id);
      },
    );
  }

  Widget viewAll(BuildContext context, List<JobOfferDto> offers) {
    return TextButton(
      onPressed: () async {
        final isUpdated = await Navigator.pushNamed(
            context, Routes.jobsListPage,
            arguments: JobsPageModel(name, offers, special: special));
        if (isUpdated == true) {
          onRefresh();
        }
      },
      child: Text(
        strings.view_all,
        style: kTextRegular.copyWith(color: kBrownishGrey, fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildOffersSliderSection();
  }

  Widget errorWidget(Object error) {
    return ErrorPlaceHolderWidget(
      height: 220,
      exception: error,
      onClickReload: () {
        onRefresh();
      },
    );
  }

  headerWidget(BuildContext context, List<JobOfferDto> offers) {
    return Row(
      children: [
        header != null
            ? header!
            : Text(
                name,
                style: kTextMedium.copyWith(color: kBlackGrey),
              ),
        const Spacer(),
        viewAll(context, offers),
      ],
    );
  }
}
