 import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../core/utils/app_icons.dart';
import '../../../shared/components/index.dart';
import '../../resources/colors.dart';

class AllButtonsActions extends BaseStatelessWidget {
  final void Function() saveAdvancedFilterData;
  final void Function() clearAdvancedFilterData;
  final void Function() onFetchDataWithFilter;

  AllButtonsActions({Key? key, required this.saveAdvancedFilterData, required this.clearAdvancedFilterData, required this.onFetchDataWithFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Row(
        children: [
          TextButton.icon(
            icon: kLoadSvgInCirclePath(AppIcons.filter, color: kYellow_2),
            label: Text(
              strings.save_filter,
              style: kTextSemiBold.copyWith(color: kYellow_2),
            ),
            onPressed: saveAdvancedFilterData,
          ),
          const Spacer(),
          TextButton(
            child: Text(
              strings.delete_all,
              style: kTextSemiBold.copyWith(color: kPrimary),
            ),
            onPressed: clearAdvancedFilterData,
          ),
          AppCupertinoButton(
            text: strings.view_search_results,
            radius: BorderRadius.circular(10),
            textStyle: kTextSemiBold.copyWith(color: kWhite, fontSize: 16),
            onPressed: onFetchDataWithFilter,
          ),
        ],
      ),
    );
  }
}