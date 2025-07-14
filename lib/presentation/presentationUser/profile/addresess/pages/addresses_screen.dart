

import 'package:flutter/material.dart';

import '../../../../../common/data/models/add-address/address.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../widgets/address_item_widget.dart';

class AddressesScreen extends BaseStatelessWidget {
  final Function() onRefresh;
  final List<AddressDto> addresses;
  AddressesScreen({Key? key, required this.onRefresh, required this.addresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        return AddressItemWidget(
          address: addresses[index],
          onRefresh: onRefresh
        );
      },
    );
  }
}


