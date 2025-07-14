
import '../../../../../../shared/components/index.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

class TabsSwitchCameraSearchResults extends BaseStatelessWidget {
  final VehicleVideoParams vehicleVideoParams;
  final Function(int)? onTap;
  TabsSwitchCameraSearchResults({super.key, required this.vehicleVideoParams, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: DynamicTabBarView(
        tabs: [
          DynamicItem(id: 0, name: strings.videos),
          DynamicItem(id: 1, name: strings.live_streaming),
        ],
        isSeparate: true,
        initialIndex: vehicleVideoParams.isVideoStream == true ? 1 : 0,
        padding: EdgeInsets.zero,
        marginTabs: EdgeInsets.symmetric(horizontal: 10),
        onTap: onTap,
      ),
    );
  }
}
