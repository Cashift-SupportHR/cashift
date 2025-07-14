import 'package:flutter/material.dart';
 import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../presentationUser/map_picker/widgets/map_picker_item.dart';
import '../../../../../../shared/components/buttons/row_buttons.dart';
import '../../../../../../shared/components/map/map_picker.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../data/models/index.dart';
import '../../bloc/add_additional_locations_bloc.dart';
import 'add_additional_locations_screen.dart';

class AddAdditionalLocationsPage extends BaseBlocWidget<Initialized<List<LocationProjectParams>>, AdditionalLocationsCubit> {
  final Function()? idCallback;
  final Function()? onNext;
  final Function()? onPrevious;
   AddAdditionalLocationsPage({Key? key, this.idCallback, this.onNext, this.onPrevious}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData(getProjectId(context));
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  String? title(context) {
    return idCallback != null ? null : strings.edit_additional_sites;
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BuildTextFieldItem(
              title: strings.additional_locations,
              hintText: strings.add_location,
              keyboardType: TextInputType.name,
              heightSizedBox: 10,
              controller: controller,
              suffixIcon: Icons.add,
              onTap: () {
                addLocation();
              },
            ),
            SizedBox(height: 10),
            buildConsumer(context),
          ],
        ),
      ),
    ));
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<LocationProjectParams>> state) {
    return AddAdditionalLocationsScreen(
      locations: state.data,
      onNext: () {
        onNext!();
      },
      onEditLocation: (params) {
        params.projectId = getProjectId(context) ?? idCallback!();
        bloc.editLocationProject(params);
      },
      onDeleteLocation: (id) {
        bloc.deleteLocationProject(id);
      },
    );
  }

  @override
  Widget? bottomNavigationBar(context) {
    return idCallback != null
        ? RowButtons(
            textSaveButton: strings.next,
            textCancelButton: strings.previous,
            onSave: () {
              onNext!();
            },
            onCancel: () {
              onPrevious!();
            },
          )
        : null;
  }

  Future<void> addLocation() async {
    MapPickerItem result = await navigatorMapPicker(context);
    final params = LocationProjectParams(
      description: result.formattedAddress ?? '',
      latitude: result.geometry?.location?.lat?.toString() ?? '0.0',
      longtude: result.geometry?.location?.lng?.toString() ?? '0.0',
      projectId: getProjectId(context) ?? idCallback!() ?? 0,
      id: 0,
    );
    bloc.addLocationProject(params);
  }

  int getProjectId(BuildContext context) {
    return (getArguments(context) ?? idCallback!()) as int;
  }

  @override
  void buildListener(BuildContext context, state) {
    if (idCallback == null) {
      if (state is SuccessStateListener) {
        dismissProgress();
        onRequestSuccess(state.data);
      }
    }
    loadInitialData(context);
  }
}
