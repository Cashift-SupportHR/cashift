import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/admin_wallet/presentation/widgets/item_wallet_widget.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';

import '../../data/models/admin_wallet_prams.dart';
import '../../domain/entities/admin_wallet.dart';
import '../../domain/entities/filterAndTaps.dart';
import '../widgets/filter_wallet.dart';

class AdminWalletScreen extends BaseStatelessWidget {
  var filterController = TextEditingController();
  final int type;
  FilterAndTaps tabsAndFilter;

  ScrollController scrollController;
  String? dateFilter;
  AdminWallet adminWallet;
  Function({required AdminWalletPrams adminWalletPrams}) onChange;
  AdminWalletScreen({required this.type, this.dateFilter, required this.scrollController, required this.onChange, required this.tabsAndFilter, required this.adminWallet});
  PickerDateRange? dateRange = PickerDateRange(DateTime.now(), DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          filterAdminWallet(onChange: onChange, dateFilter: dateFilter ?? strings.select, type: type, tabsAndFilter: tabsAndFilter),
          ListView.builder(
            itemCount: adminWallet.design == 1 ? adminWallet.deposit?.length : adminWallet.pendingPayed?.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            controller: scrollController,
            itemBuilder: (context, index) {
              return ItemAdminWalletWidget(
                pendingPayedAdminWallet: adminWallet.design != 1 ? adminWallet.pendingPayed![index] : null,
                depositAdminWallet: adminWallet.design == 1 ? adminWallet.deposit![index] : null,
                design: adminWallet.design ?? 0,
              );
            },
          ),
        ],
      ),
    );
  }
}
