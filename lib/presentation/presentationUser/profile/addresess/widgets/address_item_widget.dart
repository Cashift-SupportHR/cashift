import 'package:flutter/material.dart';
import 'package:shiftapp/core/services/routes.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../data/models/add-address/address.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/image_builder.dart';
import '../../../../shared/components/outlint_button.dart';
import '../../../resources/constants.dart';

class AddressItemWidget extends BaseStatelessWidget {
  final Function() onRefresh;
  final AddressDto address;
  AddressItemWidget({Key? key, required this.onRefresh, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),

      // color: currentFillColor,

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BuildRowIconWithString(
              icon: 'images/location.svg',
              text: address.name ?? '',
            ),
            const SizedBox(
              height: 8,
            ),
            _BuildRowIconWithString(
              icon: AppIcons.onYourWay,
              text: address.details ?? '',
            ),
            AppOutlineButton(
              text: strings.open_map,
              onClick: () {
                onEditAddress(context);
              },
              borderWidth: 0.8,
              radius: 10,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            )
          ],
        ),
      ),
    );
  }
  onEditAddress(BuildContext context) async {
   final isRefresh = await Navigator.pushNamed(context, Routes.addAddress, arguments: address);
    if (isRefresh == true) {
      onRefresh();
    }
  }
}

class _BuildRowIconWithString  extends StatelessWidget {
  final String text;
  final String icon;
  const _BuildRowIconWithString ({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kLoadSvgInCirclePath(icon, width: 25, height: 25),
        SizedBox(width: 10,),
        Flexible(child: Text(text,style: kTextMediumPrimary.copyWith(fontSize: 14),))
      ],
    );
  }
}
