import 'package:flutter/material.dart';
import '../../../../shared/components/index.dart';
import '../../../common/common_state.dart';
import '../../../common/loading_stream_exception.dart';
import '../../../locationservice/location_required_exception.dart';
import '../../../locationservice/locationservice.dart';
import '../../../mana_delivery/domain/entities/delivery_orde.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'mana_order_cart.dart';
import 'permission_resume_listener.dart';

class ManaOrderWidget extends BaseStatelessWidget {
  final StreamState<List<DeliveryOrderEntity>> deliveryOrdersStream;
  final VoidCallback onRetry;
  Function()onRefresh;
  ManaOrderWidget({
    super.key,
    required this.deliveryOrdersStream,
    required this.onRetry,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DeliveryOrderEntity>>(
      stream: deliveryOrdersStream.stream,
      builder: (context, snapshot) {
        // Handle error state
        if (snapshot.hasError) {
          // Show loading indicator for LoadingStreamException
          if (snapshot.error is LoadingStreamException) {
            return const SizedBox(
              height: 180,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          // Show location widget for LocationRequiredException
          if (snapshot.error is LocationRequiredException) {
            return _buildLocationRequiredWidget(context);
          }
          // For other errors, show nothing
          return const SizedBox.shrink();
        }

        // Handle loading state
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 250,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // Handle data state
        final orders = snapshot.data!;
        if (orders.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.offer_delivery,
              style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: orders.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ManaOrderCart(data: orders[index],onRefresh: onRefresh,);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLocationRequiredWidget(BuildContext context) {
    final exception = LocationRequiredException();
    return PermissionResumeListener(
      onResume: () async {
        onRetry();
      },
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off_outlined, size: 48, color: kPrimary),
            const SizedBox(height: 12),
            Text(
              exception.toString(),
              style: kTextMedium.copyWith(fontSize: 14, color: kFontDark),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  strings.open_app_settings,
                  style: kTextMedium.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
