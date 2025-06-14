import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../presentationUser/resources/constants.dart';
import 'base_stateless_widget.dart';
import 'material_text_field.dart';


class SearchWidget extends BaseStatelessWidget {
  final ValueChanged<String> search;
  final String ?hint ;

  SearchWidget({required this.search ,  this.hint});
  @override
  Widget build(BuildContext context) {
    return searchWidget(context);
  }

  TextEditingController searchController = TextEditingController();
  Widget searchWidget(BuildContext context) {
    return SizedBox(
      height: 40,
      child: MaterialTextField(
          style: kTextMedium.copyWith(fontSize: 16),
          controller: searchController,
          onChanged: (text) {
            search(text);
          },
          maxLines: 1,
          inputDecoration: InputDecoration(
            filled: false,
            isDense: false,
            alignLabelWithHint: true,
            hintStyle: kTextRegularGrey,
            contentPadding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              borderSide: BorderSide(color: kSilver, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              borderSide: const BorderSide(color: kSilver, width: 1.0),
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 18, maxWidth: 60),
            hintText: hint ?? strings.search,
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
              child: SvgPicture.asset(
                Assets.imagesIcSearch,
              ),
            ),
            suffix: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  searchController.clear();
                  search('');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(
                    Icons.close,
                    color: kBattleShipGrey,
                  ),
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              borderSide: const BorderSide(color: kSilver, width: 1.0),
            ),
          )),
    );
  }
}
