import 'package:flutter/material.dart';
import '../../../../../core/services/routes.dart';
import '../../../../shared/components/index.dart';
import '../../../common/common_state.dart';
import '../../../mana_delivery/domain/entities/my_order.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'my_order_cart.dart';

class MyOrderWidget extends BaseStatelessWidget {
  final StreamState<MyOrderEntity> myOrderEntityStream;
  final Function() onRefresh;

  MyOrderWidget({required this.onRefresh, required this.myOrderEntityStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyOrderEntity>(
      stream: myOrderEntityStream.stream,
      builder: (context, snapshot) {
        return (!snapshot.hasData ||
                snapshot.data!.results == null ||
                snapshot.data!.results!.isEmpty)
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        strings.pending_delivery_requests,
                        style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.myOrderPage);
                         },
                        child: Text(
                          strings.view_all,
                          style: kTextMedium.copyWith(color: kPrimary, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: snapshot.data?.results?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MyOrderCart(
                          data: snapshot.data!.results![index],
                          onRefresh: onRefresh,
                          isExpanded: false,
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
