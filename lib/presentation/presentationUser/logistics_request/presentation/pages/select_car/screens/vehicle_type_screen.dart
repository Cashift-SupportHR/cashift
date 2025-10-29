import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../shared/components/index.dart';
import '../../../../domain/entities/index.dart';
import '../widget/select_car_item.dart' show SelectCarItem;

class VehicleTypeScreen extends BaseStatelessWidget {
  final Function(int id)? onNext;
  List<CarLogisticsEntity> cars;

  VehicleTypeScreen({super.key, required this.onNext,required this.cars  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            strings.select_vehicle_type,
            style: kTextBold.copyWith(fontSize: 14, color: kGreen_144)
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    onNext!(cars[index].id??0);
                  },
                  child: SelectCarItem(data: cars[index]));
            },
          ),
        ),
      ],
    );
  }
}
