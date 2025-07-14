import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/shift_item_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/shared/components/error_handler_widget.dart';
import 'package:shiftapp/presentation/shared/components/page_slider_widget.dart';
import '../../../../../core/services/routes.dart';
import '../../../../shared/components/loading_widget.dart';

class ShiftSlider extends BaseStatelessWidget {
  final Stream<List<AppliedOffer>?> stream;
  final Function onRefresh;

  ShiftSlider({required this.stream, required this.onRefresh});
  Widget buildOffersSliderSection(BuildContext context) {
    return StreamBuilder<List<AppliedOffer>?>(
        stream: stream,
        builder: (context, snapshot) {
          final offers = snapshot.data;
          return snapshot.hasError
              ? snapshot.error?.emptyListException() == true
                  ? Container()
                  : ErrorPlaceHolderWidget(
                      height: 150,
                      exception: snapshot.error,
                      onClickReload: () {
                        onRefresh();
                      },
                    )
              : snapshot.data == null
                  ? preloadingWidget(context)
                  : snapshot.data?.isEmpty == true
                      ? Container()
                      : Column(
                          children: [
                            title(context),
                            SliderWidget(
                              hight: 280,
                              length: snapshot.data?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                final dataList = snapshot.data ?? [];
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: ShiftItemWidget(
                                    dataList[index],
                                    showTimer: false,
                                    isActive: false,
                                    maxLines: 1,
                                    onClickDetails: () {
                                      navigateToDetails(
                                          context, dataList[index]);
                                    },
                                    onClickChange: (AppliedOffer shift) {},
                                    onClickCancel: (AppliedOffer shift) {},
                                  ),
                                );
                              },
                            ),
                          ],
                        );
        });
  }

  Widget title(BuildContext context, {List<AppliedOffer>? offers}) {
    return Row(
      children: [
        Text(
          strings.reserved_opportunities,
          style: kTextMedium.copyWith(color: kBlackGrey),
        ),
        const Spacer(),
        viewAll(
          context,
        ),
      ],
    );
  }

  Widget viewAll(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final isUpdated = await Navigator.pushNamed(
          context,
          Routes.appliedOffersPage,
        );
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
    return buildOffersSliderSection(context);
  }

  Future<void> navigateToDetails(
      BuildContext context, AppliedOffer data) async {
    final update = await Navigator.pushNamed(
        context, Routes.appliedOfferDetailsScreenV2,
        arguments: data);
    if (update == true) {
      onRefresh();
    }
  }

  preloadingWidget(BuildContext context) {
    return Column(
      children: [
        title(context),
        LoadingView(
          height: 180,
        ),
      ],
    );
  }
}
