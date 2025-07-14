import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../utils/app_icons.dart';
import '../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../common/components/index.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';
import '../../view/widgets/search_vehicle_caamera_sheet.dart';

class CameraSearchResultsPlaceholder extends BaseStatelessWidget {
  final VehicleVideoParams params;
  final Function() onRefresh;

  CameraSearchResultsPlaceholder({
    super.key,
    required this.params,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          _buildIcon(),
          const SizedBox(height: 10),
          _buildTitle(),
          if (params.isVideoStream == false) ...[
            const SizedBox(height: 10),
            _buildSubTitle(),
          ],
          if(params.isVideoStream == true || params.beginTime != null)
          ...[  const SizedBox(height: 20),
          _buildSelectDatesButton(context),]
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return kLoadSvgInCirclePath(
      AppIcons.videos_placeholder,
      height: 120,
      width: 120,
    );
  }

  Widget _buildTitle() {
    return Text(
      strings.there_are_videos_yet,
      style: kTextSemiBold.copyWith(fontSize: 24, color: kGreen_3D),
    );
  }

  Widget _buildSubTitle() {
    return Text(
      strings.videos_dates_validate_msg,
      textAlign: TextAlign.center,
      style: kTextRegular.copyWith(fontSize: 14, color: kGray_6D),
    );
  }

  Widget _buildSelectDatesButton(BuildContext context) {
    return IntrinsicWidth(
      child: AppCupertinoButton(
        text: strings.reload,
        // radius: BorderRadius.circular(5),
        onPressed: () {
          onRefresh();
        },
      ),
    );
  }
}
