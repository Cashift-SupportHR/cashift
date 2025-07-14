import 'package:flutter/material.dart';

import '../../../../../common/data/repositories/advancedFilter/select_model.dart';
import '../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../common/components/image_builder.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class SelectWidget extends StatelessWidget {
  final String title;
  final List<SelectModel> items;
  final int initialValue;
  final Function(int id, String name)? onSelected;

  SelectWidget({
    Key? key,
    required this.title,
    required this.initialValue,
    this.onSelected,
    required this.items,
  }) : super(key: key);

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    print('initialValue: $initialValue');
    _selectedItem = initialValue;
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: StatefulBuilder(builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kTextSemiBold.copyWith(color: kPrimary),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: getChild(
                        imagePath: items[index].logo ?? '',
                        title: items[index].name ?? '',
                        isSelected: _selectedItem == items[index].id,
                      ),
                      onTap: () {
                        _selectedItem == items[index].id! ? _selectedItem = 0 : _selectedItem = items[index].id!;
                        String name = items[index].name ?? items[0].name ?? '';

                        onSelected?.call(_selectedItem, name);

                        setState(() {});
                      },
                    );
                  }),
            )
          ],
        );
      }),
    );
  }

  Widget getChild({required String imagePath, required String title, required bool isSelected}) {
    print('isSelected: $isSelected');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: kWhite,
              border: isSelected ? Border.all(color: kCoolTeal, width: 2) : Border.all(color: kCoolTeal.withOpacity(0.38), width: 0.5),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kBlack.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(-1, 4), // changes position of shadow
                ),
              ],
            ),
            child: kBuildImage(
              imagePath,
              size: 60,
              border: 0,
            ),
          ),
          Text(title, style: kTextSemiBold.copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}




