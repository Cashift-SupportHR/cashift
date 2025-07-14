import 'package:flutter/material.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../bloc/draw_polygon_cubit.dart';
import 'draw_polygon_screen.dart';

class DrawPolygonWithMarkersPage extends BaseBlocWidget<UnInitState, DrawPolygonWithMarkersCubit> {
  DrawPolygonWithMarkersPage({Key? key})
      : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    bloc.location(context);
    return DrawPolygonWithMarkersScreen(
      myLocationStream: bloc.myLocationStream,
      predictionsSearchStream: bloc.predictionsSearchStream,
      placeDetailsStream: bloc.placeDetailsStream,
      onFetchAutoComplete: (String input) {
        bloc.fetchPlacesAutocomplete(input);
      },
      onFetchPlaceDetails: (String placeId) {
        bloc.fetchPlaceDetails(placeId);
      },
    );
  }
}
