import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiftapp/extensions/extensions.dart';

import '../../../../common/domain/entities/resume/index.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../../common/components/bottom_sheet/bottom_sheet_text_field.dart';
import '../../../shared/components/dropdown_filed.dart';
import '../../../shared/components/error_handler_widget.dart';
import '../../common/common_state.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class DistrictPickerStream extends BaseStatelessWidget {
  final StreamState<List<DistrictItem>> districtsStream;
  final dynamic Function()? onClickReload;
  final dynamic Function(int) onSelectItem;
  final int districtId;
  DistrictPickerStream(
      {Key? key,
      required this.districtsStream,
      this.onClickReload,
      required this.onSelectItem,
      required this.districtId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DistrictItem>?>(
        stream: districtsStream.stream,
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            return ErrorPlaceHolderWidget(
              error: strings.not_added_phone_wallet_data,
              onClickReload: onClickReload,
            );
          }
          if (snapshot.data != null && snapshot.data!.isEmpty == false) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.select_district,
                  style: kTextMedium.copyWith(fontSize: 14, color: kFontDark),
                ),
                const SizedBox(
                  height: 8,
                ),
                districtListPicker(districts: snapshot.data!),
              ],
            );
          }
          return const SizedBox();
        });
  }

  districtListPicker({required List<DistrictItem> districts}) {
    String districtName = districts
            .firstWhereOrNull((element) => element.id == districtId)
            ?.name ??
        '';
    return BottomSheetTextField(
      items: districts.map((e) => Item(index: e.id!, value: e.name!)).toList(),
      inputDecoration: kTextFieldDecoration.copyWith(
          suffixIconConstraints: const BoxConstraints(maxHeight: 20),
          hintStyle: kTextRegular.copyWith(fontSize: 12, color: kBlueGrey),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 20, minWidth: 30)),
      title: strings.select_district,
      itemBuilder: (context, item) {
        final district =
            districts.firstWhere((element) => element.id == item.index);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 6),
              child: Text(
                district.name!,
                textAlign: TextAlign.start,
                style: kTextRegular.copyWith(
                    fontSize: 12, decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1,
              color: kSilverThree,
            ),
          ],
        );
      },
      setSearch: true,
      searchHint: strings.search,
      onSelectItem: (item) {
        onSelectItem(item.index);
      },
      initValue: districtName,
      validator: (value) {
        if (value?.isNullOrEmpty() == true) {
          return strings.please_select_district;
        }
        return null;
      },
      hint: strings.select_district,
      style: kTextRegular.copyWith(color: kAlmostBlack, fontSize: 12),
      icon: kLoadSvgIcon('bank'),
    );
  }
}
