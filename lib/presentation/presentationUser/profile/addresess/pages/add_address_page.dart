import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/data/models/add-address/address.dart';
import '../../../../shared/components/app_widgets.dart';
import '../../../../shared/components/base_widget_bloc.dart';
import '../../../common/common_state.dart';
import '../../../map_picker/bloc/map_picker_state.dart';
import '../bloc/add_address_cubit.dart';
import 'add_address_screen.dart';

class AddAddressPage
    extends BaseBlocWidget<Initialized<MapPickerState>, AddAddressCubit> {
  AddAddressPage({Key? key}) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<MapPickerState> state) {
    AddressDto address = (getArguments(context) ?? AddressDto()) as AddressDto;
    return AppScaffold(
      title: strings.add_location,
      body: AddAddressScreen(
        address: address,
        state: state.data,
        onAddressAdded: (AddressDto address) {
          bloc.addFavoriteAddresses(address, address.id != null);
        },
      ),
    );
  }

  @override
  void onSuccessDismissed() {
    super.onSuccessDismissed();
    Navigator.of(context).pop(true);
  }
}
