import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';

import '../../../../../../common/domain/entities/resume/job_item.dart';
import '../../../../../../utils/app_icons.dart';
import '../../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/image_builder.dart';
import '../../../../../../common/components/options_menu_button.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import 'favorite_job_skells_builder.dart';

class PopupMenuFavoriteJob extends BaseStatelessWidget {
  final JobItem jobItem;
  final Color iconColor;
  PopupMenuFavoriteJob({Key? key,required this.jobItem, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContentJob(
          title: strings.skills,
          iconPath: AppIcons.selectionSkills,
          isDivider: false,
        ),
      ],
      onSelect: (value) {
        if (value == 0) {
          showSelectionSkillsSheet(context, jobItem: jobItem);
        } else if (value == 1) {
          //showJobDetailsSheet(context, 1);
        }
      },
    );
  }

  showSelectionSkillsSheet(BuildContext context, {required JobItem jobItem}) {
    showAppModalBottomSheet(context: context,
        isScrollControlled: false,
        isCloseButton: false,
        isDivider: false,
      titlePadding: const EdgeInsets.only(left: 10, right: 20),
        titleWidget: Row(
          children: [
            kLoadSvgInCirclePath(
              AppIcons.selectionSkills,
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                strings.skills_required_for_job(jobItem.jobName ?? ''),
                style: kTextMedium.copyWith(fontSize: 14, color: kFontDark),
              ),
            ),
            kBuildCircleImage(
              jobItem.imagePath ?? '',
              border: 0,
            ),
          ],
        ),
        child: FavoriteJobSkillsBuilder(jobId: jobItem.id ?? 0),
    );
  }
}

class BuildPopupMenuItemContentJob extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool? isDivider;
  const BuildPopupMenuItemContentJob({Key? key, required this.title, required this.iconPath, this.isDivider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildPopupMenuItemContent(
      title: title,
      titleStyle: kTextMedium.copyWith(
        fontSize: 14,
        color: kFontDark,
      ),
      iconPath: iconPath,
      iconSize: 25,
      isDivider: isDivider ?? true,
    );
  }
}
