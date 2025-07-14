import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text_field.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../common/domain/entities/resume/index.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../../common/components/dropdown/dropdown_filed.dart';
import '../../common/common_state.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class TextFieldCityPicker extends BaseStatelessWidget {
  final int? initialCity;
  final List<CityItem> cities;
  final Function(Item) onSelectCity;

  TextFieldCityPicker(
      {Key? key,
      required this.onSelectCity,
      required this.cities,
      required this.initialCity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamState<bool> isDeleteStream = StreamStateInitial();
    TextEditingController _controller = TextEditingController();
    if (initialCity != null && initialCity != 0) {
      isDeleteStream.setData(true);
      _controller.text = cities
          .firstWhere((element) => element.id == initialCity)
          .nameAr ??
          '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.location,
            style: kTextSemiBold.copyWith(color: kPrimary),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialTextField(
              onTap: () async {
                ListPickerWidget.showPicker(
                    context: context,
                    setSearch: true,
                    title: strings.select_city,
                    searchHint: strings.search,
                    items: cities
                        .map((e) => Item(
                            index: e.id ?? 0,
                            value: e.nameAr ?? '',
                            description: e.name ?? ''))
                        .toList(),
                    onSelectItem: (item) {
                      onSelectCity(item);
                      _controller.text = item.value;
                      isDeleteStream.setData(true);
                    });
              },
              controller: _controller,
              readOnly: true,
              inputDecoration: kRequestTextFieldDecoration.copyWith(
                hintText: strings.select_your_current_city,
                hintStyle: kTextSemiBold.copyWith(fontSize: 16, color: kPrimary),
                suffixIcon: StreamBuilder<bool>(
                  stream: isDeleteStream.stream,
                  builder: (context, snapshot) {
                    return InkWell(
                      onTap: () {
                        _controller.clear();
                        onSelectCity(Item(index: 0, value: ''));
                        isDeleteStream.setData(false);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(
                            snapshot.data ?? false ? 12 : 16
                        ),
                        child: kLoadSvgInCirclePath(
                            (snapshot.data ?? false)
                                ? AppIcons.removeCircle
                                : AppIcons.arrow,
                            color: kPrimary,
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
