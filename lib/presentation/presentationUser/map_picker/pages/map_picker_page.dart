import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../common/components/base/base_widget_bloc.dart';
import '../../common/common_state.dart';
import '../bloc/map_picker_cubit.dart';
import '../bloc/map_picker_state.dart';
import '../widgets/map_picker_item.dart';
import 'map_picker_screen.dart';

class MapPickerPage extends BaseBlocWidget<Initialized<MapPickerState>, MapPickerCubit> {
  final LatLng? initialLatLng;
  MapPickerPage({Key? key, this.initialLatLng})
      : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<MapPickerState> state) {
    return MapPickerScreen(
      initialLatLng: initialLatLng,
      state: state.data,
    );
  }
}
