import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/buttons/row_buttons.dart';

import '../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../shared/components/dialogs_manager.dart';
import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';
import 'custody_initialize_state.dart';
import 'widgets/add_covenant_button.dart';
import 'widgets/covenant_received_item.dart';

///  Created by harbey on 5/15/2023.
class CovenantReceivedScreen extends BaseStatelessWidget {
  final Function(List<AddCovenantFocusPointParams>) onSaveAddFocusPoint;
  final Function(AddCovenantFocusPointParams) onSaveEditFocusPoint;
  final CustodyInitializeState state;
  final int focusPointId;
  final Function()? onPrevious;
  final Function(AddCovenantFocusPointParams params) onDelete;

  CovenantReceivedScreen(
      {Key? key,
      required this.onSaveAddFocusPoint,
      required this.focusPointId,
      this.onPrevious,
      required this.state,
      required this.onSaveEditFocusPoint,
      required this.onDelete})
      : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pointNameController = TextEditingController();
  int project = 0;
  int pointType = 0;
  int priorityLevel = 0;
  int employeeType = 0;
  String idNumber = '';
  LocationData? locationData;

  StreamStateInitial<List<AddCovenantFocusPointParams>> covenantsStream =
      StreamStateInitial<List<AddCovenantFocusPointParams>>();

  List<AddCovenantFocusPointParams> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomSheet: optionButtons(context),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
        child: Column(
          children: [
            AddCovenantButton(
              onTap: () {
                items.add(AddCovenantFocusPointParams());
                covenantsStream.setData(items);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            state.custody != null && state.custody!.isNotEmpty == true
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.custody?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CovenantReceivedItem(
                        item: state.custody![index],
                        focusPointId: focusPointId,
                        covenantTypes: state.custodyTypes,
                        onSave: (params) {
                          //TODO save by api and reload
                          onSaveEditFocusPoint(params);
                        },
                        onTapDelete: () {
                          DialogsManager.showConfirmationAnimatedDialog(context,
                              message:
                                 strings.delete_custody ,
                              onConfirm: () {
                            onDelete(state.custody![index]);
                          });
                          //TODO delete by api and reload
                        },
                      );
                    },
                  )
                : const SizedBox.shrink(),
            StreamBuilder<List<AddCovenantFocusPointParams>>(
              stream: covenantsStream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CovenantReceivedItem(
                        item: items[index],
                        focusPointId: focusPointId,
                        covenantTypes: state.custodyTypes,
                        onSave: (params) {
                          if (state.isNew == true) {
                            items[index] = params;
                            covenantsStream.setData(items);
                          } else {
                            onSaveAddFocusPoint([params]);
                          }
                        },
                        onTapDelete: () {
                          items.removeAt(index);
                          covenantsStream.setData(items);
                        },
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget optionButtons(BuildContext context) {
    if (state.isNew == false) return const SizedBox.shrink();
    return StreamBuilder<List<AddCovenantFocusPointParams>>(
        stream: covenantsStream.stream,
        builder: (context, snapshot) {
          return RowButtons(
            onSave: snapshot.hasData
                ? () {
                    onSaveAddFocusPoint(items);
                  }
                : null,
            onCancel: () {
              onPrevious?.call();
            },
          );
        });
  }
}
