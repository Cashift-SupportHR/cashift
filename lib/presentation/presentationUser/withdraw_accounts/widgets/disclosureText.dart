import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

class DisclosureListWidget extends BaseStatelessWidget{

  final List<String> disclosures  ;
  DisclosureListWidget({required this.disclosures});

  @override
  Widget build(BuildContext context) {
    return disclosureText();
  }

  Widget disclosureText() {

    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(color: kWhiteF2, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              strings.important_disclosure,
              style: kTextMedium.copyWith(fontSize: 14, color: kGreyishBrown),
            ),
            Column(
              children: disclosures.map((e) => disclosureItem(e)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget disclosureItem(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(
        children: [
          const Text('* '),
          Expanded(
              child: Text(
                text,
                style: kTextRegular.copyWith(fontSize: 13, color: kBrownishGrey),
              )),
        ],
      ),
    );
  }
}

