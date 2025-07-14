import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../utils/app_icons.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../index.dart';


class BottomSheetOptionsMenu extends StatelessWidget {
  final List<BottomSheetOption> options;
  final Function(BottomSheetOption)? onOptionSelected;
  const BottomSheetOptionsMenu({super.key, required this.options, this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomSheetOptionList.show(
          context,
          options: options,
          onOptionSelected: (option) {
            if (onOptionSelected != null) {
              onOptionSelected!(option);
            }
          },
        );
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: kLoadSvgInCirclePath(
          AppIcons.menu,
          height: 6,
          width: 6,
        ),
      ),
    );
  }
}


class BottomSheetOptionList extends StatelessWidget {
  final List<BottomSheetOption> options;
  final Function(BottomSheetOption)? onOptionSelected;
  const BottomSheetOptionList({super.key, required this.options, this.onOptionSelected});


  static show(
    BuildContext context, {
    required List<BottomSheetOption> options,
    Function(BottomSheetOption)? onOptionSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BottomSheetOptionList(
          options: options,
          onOptionSelected: onOptionSelected,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: options.length,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        itemBuilder: (context, index) {
          return BottomSheetOptionItem(
            option: options[index],
            onOptionSelected: (option) {
              if (onOptionSelected != null) {
                onOptionSelected!(option);
              }
            },
          );
        },
      ),
    );
  }
}

class BottomSheetOptionItem extends StatelessWidget {
  final BottomSheetOption option;
  final Function(BottomSheetOption)? onOptionSelected;
  const BottomSheetOptionItem({
    super.key,
    required this.option,
    this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: Decorations.boxDecorationBorder(
        borderColor: kGray_79,
        radius: 10,
      ),
      child: ListTile(
        leading: option.icon != null
            ? kLoadSvgInCirclePath(option.icon!, height: option.iconSize ?? 25, width: option.iconSize ?? 25)
            : null,
        title: Text(
          option.title,
          style: option.titleStyle ?? kTextSemiBold.copyWith(color: kGreen_54, fontSize: 18),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: kBlack_33,
          size: 20,
        ),
        contentPadding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 15,
        ),
        onTap: () {
          if (option.onTap != null) {
            option.onTap!();
          } else if (option.routeName != null) {
            Navigator.pushNamed(
              context,
              option.routeName!,
              arguments: option.arguments,
            );
          }
          if (onOptionSelected != null) {
            onOptionSelected!(option);
          }
        },
      ),
    );
  }
}

class BottomSheetOption{
  final String title;
  final String? icon;
  final double? iconSize;
  final TextStyle? titleStyle;
  final VoidCallback? onTap;
  final String? routeName;
  final dynamic arguments;

  const BottomSheetOption({
    required this.title,
    this.icon,
    this.iconSize,
    this.titleStyle,
    this.onTap,
    this.routeName,
    this.arguments,
  });
}