
import '../../../../../../shared/components/index.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

class VehicleInfoCameraSearchResults extends BaseStatelessWidget {
  final CameraSearchResultArgs args;
  VehicleInfoCameraSearchResults({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      decoration: Decorations.shapeDecorationShadow(),
      child:  ListRowTextsIconsV2(
        isMark: true,
        items: args.vehicle.toListRowTextItems(strings),
      ),
    );
  }
}
