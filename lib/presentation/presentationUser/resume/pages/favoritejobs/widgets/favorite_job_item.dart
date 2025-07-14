import 'package:flutter/material.dart';

import '../../../../../../common/domain/entities/resume/job_item.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../../resources/constants.dart';
import 'popup_menu_favorite_job.dart';

class FavoriteJobItem extends StatelessWidget {
  final JobItem jobItem;
  final Color currentFillColor;
  final Color currentIconColor;
  final Color textColor;
  const FavoriteJobItem({Key? key, required this.jobItem, required this.currentFillColor, required this.currentIconColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 5),
      decoration: BoxDecoration(
        color: currentFillColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          PopupMenuFavoriteJob(
            jobItem: jobItem,
              iconColor: textColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kBuildCircleImage(
                  jobItem.imagePath ?? '',
                  border: 0,
                  backgroundColor: currentIconColor,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    jobItem.jobName ?? '',
                    style: kTextRegular.copyWith(fontSize: 12, color: textColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
