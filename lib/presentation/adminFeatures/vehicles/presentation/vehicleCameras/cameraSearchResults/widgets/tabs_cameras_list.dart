
import '../../../../../../shared/components/index.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

class TabsCamerasList extends BaseStatelessWidget {
  final CameraSearchResultArgs args;
  final List<VehicleCamera> vehicleCameras;
  final Function(VehicleCamera)? onTap;
  TabsCamerasList({super.key, required this.args, required this.vehicleCameras, required this.onTap});

  @override
  Widget build(BuildContext context) {
    int initialIndex = VehicleCamera.getInitialIndex(args.vehicleCameras, args.initialCamera?.id);
    return SizedBox(
      height: 80,
      child: DynamicTabBarView(
        tabs: VehicleCamera.toDynamicItems(args.vehicleCameras),
        isSeparate: true,
        initialIndex: initialIndex,
        isScrollable: true,
        padding: EdgeInsets.symmetric(vertical: 10),
        marginTabs: EdgeInsets.symmetric(horizontal: 10),
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        onTap: (int id) {
          if (onTap != null) {
            onTap!(VehicleCamera.getItemById(args.vehicleCameras, id));
          }
        },
      ),
    );
  }
}
