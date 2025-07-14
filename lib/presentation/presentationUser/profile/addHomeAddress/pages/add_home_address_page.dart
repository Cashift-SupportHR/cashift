import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/data/models/add-address/address_home_dialog_dto.dart';
import '../../../../../common/domain/entities/required_tasks/in_app_required_task.dart';
import '../../../../../common/domain/entities/resume/city_item.dart';
import '../../../../shared/components/base_widget_bloc.dart';
import '../../../../../common/data/models/add-address/add_home_location_params.dart';
import '../../../../../common/components/buttons/row_buttons.dart';
import '../../../../shared/components/dialogs_manager.dart';
import '../../../../shared/components/image_builder.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../bloc/add_home_address_cubit.dart';
import '../bloc/add_home_address_state.dart';
import 'add_home_address_screen.dart';

class AddHomeAddressPage
    extends BaseBlocWidget<Initialized<AddHomeAddressState>, AddHomeAddressCubit> {
  AddHomeAddressPage({Key? key}) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAllCities();
  }
  @override
  String? title(BuildContext context) {
    return  strings.add_address;
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<AddHomeAddressState> state) {
    return AddHomeAddressScreen(
      data: state.data,
      districtsStream: bloc.districtsStream,
      onFetchDistricts: (cityId) {
        bloc.fetchDistricts(cityId);
      },
      onAddressAdded: (AddHomeLocationParams params) {
        bloc.addAddress(params);
      },
      predictionsSearchStream: bloc.predictionsSearchStream,
      placeDetailsStream: bloc.placeDetailsStream,
      onFetchSearchLocations: (String input) {
        bloc.fetchPlacesAutocomplete(input);
      },
      onFetchPlaceDetails: (String placeId) {
        bloc.fetchPlaceDetails(placeId);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    Navigator.of(context).pop(true);
  }

  static showDialogNavigator(BuildContext context, {required InAppRequiredTask data}){
    AddressHomeDialogDto addressHomeDialogDto = AddressHomeDialogDto.fromJson(data.objects);
   return DialogsManager.customDialog(context, child: Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kBuildImage(
              addressHomeDialogDto.logo ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
              border: 0,
            ),
            Text(addressHomeDialogDto.mainText ?? '', style: kTextBold.copyWith(color: kRed_1E, fontSize: 18)),
            const SizedBox(height: 10),
            Text(addressHomeDialogDto.description ?? '', style: kTextRegular.copyWith(fontSize: 16), textAlign: TextAlign.center,),
            RowButtons(
              textSaveButton: data.actionName ?? '',
              textCancelButton: data.negativeActionName ?? context.getStrings().cancel,
              onSave: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/${data.routeName}',
                    arguments: data.dataObject());
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
