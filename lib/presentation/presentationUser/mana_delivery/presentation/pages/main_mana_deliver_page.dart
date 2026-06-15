import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/presentation/pages/resend_code/screens/resend_code_page.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../shared/components/stepper/custom_linear_step_indicator.dart';
import '../../domain/entities/delivery_orde.dart';
import '../../domain/entities/my_order.dart';
import '../../domain/entities/nearby_warehouses.dart';
import '../../domain/entities/order_mana.dart';
import 'details_order_mana/screens/details_order_mana_page.dart';
import 'go_to_customer_mana/screens/go_to_customer_mana_page.dart';
import 'nearest_warehouse/screens/nearest_warehouse_page.dart';

class MainManaDeliverPage extends BaseStatelessWidget {

  MainManaDeliverPage({Key? key }) : super(key: key);

  PageController? _pageController;
  final StreamStateInitial<int> pageStream = StreamStateInitial();
  OrderManaEntity? orderManaEntity;
  NearbyWarehousesEntity? nearbyWarehousesEntity;

  @override
  Widget build(BuildContext context) {
    final rawArgs = getArguments(context);

    DeliveryOrderEntity deliveryOrderEntity;
    int initialPage = 0;

    if (rawArgs is Map) {
      deliveryOrderEntity = rawArgs['entity'] as DeliveryOrderEntity;
      initialPage = (rawArgs['initialPage'] as int?) ?? 0;

      // Pre-populate entities from MyOrderItemEntity when skipping to last page
      final myOrderItem = rawArgs['myOrderItem'] as MyOrderItemEntity?;
      if (myOrderItem != null && orderManaEntity == null) {
        orderManaEntity = OrderManaEntity(
          id: myOrderItem.id,
          orderNumber: myOrderItem.orderNumber,
          customerName: myOrderItem.customerName,
          customerPhone: myOrderItem.customerPhone,
          customerAddress: myOrderItem.customerAddress,
          customerNotes: myOrderItem.customerNotes,
          cityId: myOrderItem.cityId,
          cityName: myOrderItem.cityName,
          districtId: myOrderItem.districtId,
          districtName: myOrderItem.districtName,
          latitude: myOrderItem.latitude,
          longitude: myOrderItem.longitude,

          mapUrl: myOrderItem.mapUrl,
          baseServicePrice: myOrderItem.baseServicePrice,
          floorPrice: myOrderItem.floorPrice,
          totalPrice: myOrderItem.totalPrice,
          status: myOrderItem.status,
          statusName: myOrderItem.statusName,
          warehouseId: myOrderItem.warehouseId,
          warehouseName: myOrderItem.warehouseName,
          floorNote: myOrderItem.floorNote,
        );
        nearbyWarehousesEntity = NearbyWarehousesEntity(
          id: myOrderItem.warehouseId,
          name: myOrderItem.warehouseName,
          cityName: myOrderItem.cityName,
          districtName: myOrderItem.districtName,
          latitude: myOrderItem.warehouseLatitude,
          longitude: myOrderItem.warehouseLongitude,
          mapUrl: myOrderItem.warehouseMapUrl,
          );
      }
    } else {
      deliveryOrderEntity = rawArgs as DeliveryOrderEntity;
    }

    _pageController ??= PageController(initialPage: initialPage);

    if (initialPage > 0 && !pageStream.hasData) {
      pageStream.setData(initialPage + 1);
    }

    return AppScaffold(
      title: strings.job_path,
      onClickBack: (){

        Navigator.pop(context,true);
      },

      body: CustomLinearStepIndicator(
        icons: [],

        labels: [
          strings.details_order,
          strings.nearest_warehouse,
          strings.resend_code,
          strings.go_to_customer,
        ],
        pages: [
          DetailsOrderManaPage(
            onNext: (data) {
              orderManaEntity = data;
              animateToPage(1);
            },
            callDeliveryOrder: () => callData(deliveryOrderEntity),
          ),

          NearestWarehousePage(
            onCallIdOrder: () => callData(deliveryOrderEntity.id),
            onNext: (data) {
              nearbyWarehousesEntity = data;
              animateToPage(2);
            },
          ),

          ResendCodePage(
            nearbyWarehousesCall: () => callData(nearbyWarehousesEntity),
            orderCall: () => callData(orderManaEntity),
            onNext: () {
              animateToPage(3);
            },
          ),
          GoToCustomerManaPage(
            onNext: () {},
            deliveryOrderCall: () => callData(deliveryOrderEntity),
            orderCall: () => callData(orderManaEntity),
            nearbyWarehousesCall: () => callData(nearbyWarehousesEntity),
          ),
        ],
        pageStream: pageStream,
        pageController: _pageController!,
        onPageChanged: (index) {},
      ),
    );
  }

  callData(data) {
    return data;
  }

  animateToPage(int index) {
    _pageController!.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
