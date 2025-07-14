import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/models/attendance/present_type.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

 import '../../../../shared/components/base_stateless_widget.dart';
import '../../../resources/colors.dart';

class FingerprintActionsList extends BaseStatelessWidget {
  final List<PresentType>? presentType;
  final Function(int)? onFingerPrint;
  FingerprintActionsList({Key? key, required this.presentType, this.onFingerPrint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: presentType!
            .map((e) => _BuildItem(
                  presentType: e,
                  onTap: () {
                    onFingerPrint!(e.id!);
                  },
                ))
            .toList(),
      ),
    );
  }
}

class _BuildItem extends StatelessWidget {
  final PresentType presentType;
  final Function()? onTap;
  const _BuildItem({Key? key, required this.presentType, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (presentType.isActive ?? true) ? onTap : null,
      child: Container(
        height: 100,
        width: 85,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: (presentType.isActive ?? true) ? kWhite : kWhite.withOpacity(0.5),
          border: Border.all(color: kSilver, width: 0.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: (presentType.isActive ?? true) ?
          const [
            BoxShadow(
              color: Color.fromRGBO(30, 134, 111, 0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ] : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kBuildCircleImage(
              presentType.icon ?? '',
              size: 45,
              border: 0,
              showFullImage: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(child: Text(presentType.name ?? '', style: kTextMediumPrimary.copyWith(fontSize: 12), textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}

