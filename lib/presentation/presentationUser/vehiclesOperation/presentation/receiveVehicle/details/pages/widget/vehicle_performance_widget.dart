import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../../shared/components/map/points_map_screen.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';
import '../../../../../domain/entities/vehicle_performance.dart';
import '../../bloc/receive_vehicle_details_state.dart';
import 'customExpansionTile.dart';

class VehiclePerformanceWidget extends BaseStatelessWidget {
  final ReceiveVehicleDetailsState state;
  final Function(int) onFetchVehiclePerformance;

  VehiclePerformanceWidget({
    super.key,
    required this.onFetchVehiclePerformance,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: strings.vehicle_performance,
      icon: AppIcons.speed,
      isShowBorder: false,
      countStream: state.vehiclePerformanceCountStream,
      onExpansionChanged: (value) {
        if (state.vehiclePerformanceStream.data == null) {
          onFetchVehiclePerformance(state.details.id ?? 0);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12),

        child: StreamDataStateWidget<VehiclePerformance?>(
          stream: state.vehiclePerformanceStream,
          builder: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            strings.maximum_recorded_speed,
                            style: kTextSemiBold.copyWith(
                              color: kGray_88,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${data?.maxSpeed} ${strings.km_h}",
                            style: kTextRegular.copyWith(
                              color: kBlack,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Image.asset(Assets.vehicleSpeed)),
                  ],
                ),
                Text(
                  strings.vehicle_path,
                  style: kTextSemiBold.copyWith(color: kGray_88, fontSize: 18),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 250,
                      child: PointsMapScreen(
                        points: data?.latlongs ?? [],
                        isShowBackButton: false,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        PointsMapScreen.show(context, data?.latlongs ?? []);
                      },
                      child: FloatingActionButton(
                        backgroundColor: kWhite,
                        child: Icon(Icons.maximize, color: kPrimary),
                        mini: true,
                        elevation: 2,
                        onPressed: () {
                          PointsMapScreen.show(context, data?.latlongs ?? []);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
