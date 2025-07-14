import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dialogs_manager.dart';
import '../../../domain/entities/punishment.dart';
import '../../../domain/entities/punishments_status.dart';
import '../widgets/punishment_item.dart';

class PunishmentsScreen extends BaseStatelessWidget {
  final int type;
  final List<Punishment> punishments;
  final Function() onRefresh;
  final Function(int) onActivate;
  final Function(int) onDelete;
  PunishmentsScreen({Key? key, required this.punishments, required this.type, required this.onActivate, required this.onRefresh, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: double.infinity,
      child: ListView.builder(
        itemCount: punishments.length,
        shrinkWrap:   true,
        itemBuilder: (context, index) {
          return PunishmentItem(
            type: type,
            punishment: punishments[index],
            onRefresh: onRefresh,
            onActivate: ()=>showActivateDialog(context, id: punishments[index].id ?? 0, type: type),
            onDelete: ()=> showDeleteDialog(context, id: punishments[index].id ?? 0)
          );
        },
      ),
    );
  }

  showActivateDialog(BuildContext context, {required int id, required int type}){
    DialogsManager.showConfirmationDialog(
      context,
      message: type == PunishmentsStatus.active ? strings.are_you_sure_deactivate_punishment : strings.are_you_sure_activate_punishment,
      onClickOk: (){
        onActivate(id);
        Navigator.pop(context);
      },
    );
  }
  showDeleteDialog(BuildContext context, {required int id}){
    DialogsManager.showConfirmationDialog(
      context,
      message: strings.are_you_sure_delete_punishment,
      onClickOk: (){
        onDelete(id);
        Navigator.pop(context);
      },
    );
  }
}
