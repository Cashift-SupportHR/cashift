import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import '../../../../../common/components/base/app_widgets.dart';
import '../../../../../common/components/base/base_widget_bloc.dart';
import '../bloc/add_address_cubit.dart';
import 'add_address_page.dart';
import 'addresses_screen.dart';

class AddressesPage
    extends BaseBlocWidget<Initialized, AddAddressCubit> {
  static const routeName = '/Addresses';

  AddressesPage({Key? key}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
   bloc.fetchFavoriteAddresses();
  }


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final isRefresh = await Navigator.of(context).pushNamed(Routes.addAddress);
          if (isRefresh is bool && isRefresh) {
            loadInitialData(context);
          }
        },
        child: const Icon(Icons.add),
      ),
      body:  buildConsumer(context),
      title: strings.favorite_places,
    );
  }
  @override
  Widget buildWidget(BuildContext context, Initialized state) {
   return AddressesScreen(
      addresses: state.data,
     onRefresh: () {
       bloc.fetchFavoriteAddresses();
     },
    );
  }

}