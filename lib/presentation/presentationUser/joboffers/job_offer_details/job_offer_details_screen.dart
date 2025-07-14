import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/jobs/job_details.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/job_offer_details/company_information_widget.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/job_offer_details/job_information_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateful_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/tabview/tabbar_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/components/curancy_widget.dart';

class JobOfferDetailsScreenV2 extends StatefulWidget {
  final Function onClickApply;
  final Function onClickShare;
  final JobDetail jobDetail;

  JobOfferDetailsScreenV2({
    Key? key,
    required this.onClickApply,
    required this.onClickShare,
    required this.jobDetail,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JobOfferDetailsScreenState();
  }
}

class _JobOfferDetailsScreenState extends BaseState<JobOfferDetailsScreenV2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    print('build JobOfferDetailsScreenV2');
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 16),
          Expanded(child: buildNestedScrollView(context)),
          AppCupertinoButton(
            text: strings.earning_now,
            onPressed: () {
              widget.onClickApply();
            },
          ),
        ],
      ),
    );
  }

  Widget buildHeader(JobOfferDto jobOffer, BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 12),
          kBuildCircleImage(jobOffer.logo(), size: 61),
          const SizedBox(height: 8),
          Text(
            jobOffer.jobName.toString(),
            style: kTextSemiBold.copyWith(color: kFontDark, fontSize: 20.sp),
          ),
          const SizedBox(height: 4),
          Text(
            jobOffer.projectName ?? '',
            style: kTextRegular.copyWith(color: kBattleShipGrey, fontSize: 10),
          ),
          const SizedBox(height: 16),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              buildHighLightText(jobOffer.projectAddress ?? ''),
              if (jobOffer.showPrice == true)
                Container(
                  decoration: BoxDecoration(
                    color: kPrimary.withOpacity(0.10),
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                  ),
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      CurancyWidget(
                        valuePrice: '${jobOffer.salary.toString()}',
                        valueStyle: kTextRegular.copyWith(color: kPrimary, fontSize: 10)
                      ),
                      Text(
                        "/ ${strings.day}",
                        style: kTextRegular.copyWith(color: kPrimary, fontSize: 10)
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Image.asset('images/share.png', height: 20),
                onTap: () {
                  widget.onClickShare();
                },
              ),
              Image.asset(
                jobOffer.isFavorite()
                    ? 'images/heart_fill.png'
                    : 'images/heart.png',
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHighLightText(String text) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.10),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Text(
        text,
        style: kTextRegular.copyWith(color: kPrimary, fontSize: 10),
      ),
    );
  }

  List<TabItemModel> createTabs(BuildContext context) {
    final List<TabItemModel> tabs = [
      TabItemModel(
        label: strings.opportunity_details,
        page: JobInformationWidget(widget.jobDetail),
      ),
      TabItemModel(
        label: strings.company_details,
        page: CompanyInformationWidget(widget.jobDetail),
      ),
    ];
    return tabs;
  }

  Widget buildNestedScrollView(BuildContext context) {
    final tabs = createTabs(context);
    final _tabController = TabController(length: tabs.length, vsync: this);

    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: buildHeader(widget.jobDetail.jobOffer, context),
          ),
          SliverToBoxAdapter(child: buildTabs(_tabController, tabs)),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: tabs.map((e) => e.page).toList(),
      ),
    );
  }

  Widget buildTabs(TabController _tabController, List<TabItemModel> tabs) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: kBackground,
        border: Border.all(
          color: kSilver,
          width: 0.5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: kPrimary,
        unselectedLabelStyle: kTextLabel,
        labelStyle: kTextRegular.copyWith(fontSize: 11),
        labelColor: Colors.white,
        unselectedLabelColor: kSilverTwo,
        indicator: const BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.all(Radius.circular(21)),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: tabs.map((e) => e.builder()).toList(),
      ),
    );
  }
}
