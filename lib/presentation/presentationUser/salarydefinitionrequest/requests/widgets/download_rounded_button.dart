import 'package:flutter/material.dart';

import '../../../../../utils/app_icons.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/image_builder.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class DownloadRoundedButton extends BaseStatelessWidget {
  final Function()? onPressed;
   DownloadRoundedButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 16, top: 14, bottom: 4),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: kGreen_2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  strings.download_file,
                  style: kTextSemiBold.copyWith(
                    color: kWhite,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                kLoadSvgInCirclePath(AppIcons.downloadRounded, height: 20, width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
