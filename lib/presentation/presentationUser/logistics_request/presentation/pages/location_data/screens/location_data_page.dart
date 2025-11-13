import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../../domain/entities/resume/city_item.dart';
import '../../../../../../adminFeatures/projectsManagement/domain/entities/city.dart';
import '../../../../../common/common_state.dart';
import '../../../../data/models/index.dart';
import '../cubit/location_data_cubit.dart';
import 'location_data_screen.dart';

class LocationDataPage
    extends BaseBlocWidget<Initialized<List<CityItem>>, LocationDataCubit> {
  final Function(AddLogisticPrams addLogisticPrams) onNext;
  final Function() onPrevious;

  LocationDataPage({Key? key, required this.onNext, required this.onPrevious})
    : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<CityItem>> state) {
    return LocationDataScreen(
      cities: state.data,
      onNext: onNext,
      onPrevious: onPrevious,
      districtsStream: bloc.districtsStream,
      onFetchDistricts: (cityId) => bloc.fetchDistricts(cityId),
    );
  }
}
