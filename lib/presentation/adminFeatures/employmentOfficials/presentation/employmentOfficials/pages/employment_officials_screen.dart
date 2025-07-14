import 'package:flutter/material.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dialogs_manager.dart';
import '../../../domain/entities/employment_official.dart';
import '../widgets/employment_officials_item.dart';

class EmploymentOfficialsScreen extends BaseStatelessWidget {
  final int type;
  final List<EmploymentOfficial> data;
  final Function(String) onRefresh;
  final Function(int) onDeactivate;
  EmploymentOfficialsScreen({Key? key, required this.type, required this.data, required this.onRefresh, required this.onDeactivate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap:   true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      itemBuilder: (context, index) {
        print('data is ${data[index].workDays}');
        return  EmploymentOfficialItem(
          item: data[index],
          type: type,
          onRefresh: () {
            onRefresh('');
          },
          onDeactivate: () => showDeleteDialog(context, id: data[index].id ?? 0),
        );
      },
    );
  }

  showDeleteDialog(BuildContext context, {required int id}) {
    DialogsManager.showConfirmationDialog(
      context,
      message: strings.are_you_sure_deactivate_employment_official,
      onClickOk: () {
        Navigator.pop(context);
        onDeactivate(id);
      },
    );
  }
}
