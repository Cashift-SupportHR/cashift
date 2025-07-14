import '../../../../common/components/index.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class SelectItemWidget extends StatelessWidget {
  final String title;
  final List<Item> items;
  final int initialValue;
  final Function(int)? onSelected;

  SelectItemWidget({
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
      height: 120,
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
                        imagePath: items[index].value ?? '',
                        title: items[index].description ?? '',
                        isSelected: _selectedItem == items[index].index,
                      ),
                      onTap: () {
                        _selectedItem == items[index].index! ? _selectedItem = 0 : _selectedItem = items[index].index!;

                        onSelected?.call(_selectedItem);

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
              color: isSelected ? kCoolTeal : kWhite,
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
              size: 50,
              border: 0,
            ),
          ),
          Text(title, style: kTextSemiBold.copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}