import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../../../common/components/snckBar/snack_bar_manager.dart';
import '../../../../../../../../common/components/stepper/easy_step.dart';
import '../../../../../domain/entities/index.dart';
import '../../../../../data/models/index.dart';
import 'expansion_time_item.dart';

class FocusPointTimeItem extends BaseStatelessWidget {
  final int focusPointId;
  final ShiftsByProject shift;
  final List<AddFocusAttendanceTimeParams> focusPointsAttendanceTimes;
  final Function(List<AddFocusAttendanceTimeParams>)? onSaveListTimes;
  final List<PointAttendanceType> types;
  final Function(AddFocusAttendanceTimeParams) onSaveEditTime;
  final Function(int id)? onDeleteTime;
  final bool isEdit;

  FocusPointTimeItem(
      {Key? key,
      required this.focusPointsAttendanceTimes,
      required this.focusPointId,
      required this.shift,
      required this.types,
      this.onSaveListTimes,
      required this.onSaveEditTime,
      this.onDeleteTime,
      required this.isEdit})
      : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamStateInitial<List<AddFocusAttendanceTimeParams>> itemsStream =
      StreamStateInitial<List<AddFocusAttendanceTimeParams>>();
  StreamStateInitial<int> itemsCountSaved = StreamStateInitial<int>();
  List<AddFocusAttendanceTimeParams> items = [];


  bool initiallyExpanded = false;
  @override
  Widget build(BuildContext context) {
    items = focusPointsAttendanceTimes;
    items.isNotEmpty ? itemsCountSaved.setData(items.length) : null;
    items.isNotEmpty ? itemsStream.setData(items) : null;
    return StreamBuilder<List<AddFocusAttendanceTimeParams>>(
        stream: itemsStream.stream,
        initialData: items,
        builder: (context, snapshot) {
          return Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsetsDirectional.only(bottom: 16),
            decoration: Decorations.decorationWithGradientNotSpreadRadius(
              offset: const Offset(1, 0),
            ),
            child: Form(
              key: formKey,
              child: ExpansionTile(
                key: GlobalKey(),
                initiallyExpanded: initiallyExpanded,

                onExpansionChanged: (bool value) {
                  onExpansionChanged(value);
                },
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: Decorations.boxDecorationBorderShape(),
                      padding: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      child: StreamBuilder<int>(
                          stream: itemsCountSaved.stream,
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data?.toString() ?? '',
                              style: kTextBodyBold.copyWith(
                                color: kYellow_00,
                                fontSize: 14,
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        shift.shiftName ?? '',
                        style: kTextBoldTitle.copyWith(
                            fontSize: 14, color: kPrimary),
                      ),
                    ),
                  ],
                ),
                trailing: SizedBox(
                  width: 105,
                  child: InkWell(
                    onTap: () {
                      onAddAnotherTime(context);
                    },
                    child: IconText(
                      text: strings.add_new_time,
                      icon: AppIcons.add,
                      textColor: kYellow_00,
                      iconSize: 12,
                      fontSize: 12,
                    ),
                  ),
                ),
                tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  !snapshot.hasData
                      ? const SizedBox()
                      : StreamBuilder<List<AddFocusAttendanceTimeParams>>(
                      stream: itemsStream.stream,
                      initialData: items,
                      builder: (context, snapshot) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ExpansionTimeItem(
                                isEdit: isEdit,
                                item: snapshot.data![index],
                                types: types,
                                onSaveTime: (item) {
                                  onSaveAction(item,
                                      index: index);
                                },
                                onDeleteTime: () {
                                  if (snapshot.data![index].id != null && isEdit) {
                                    showDeleteDialog(context, time: snapshot.data![index]);
                                  } else {
                                    onDeleteAction(snapshot.data![index]);
                                  }
                                },
                              );
                            },
                          );
                        }
                      ),
                ],
              ),
            ),
          );
        });
  }

  onSaveAction(AddFocusAttendanceTimeParams time, {required int index}) {
    if (isEdit) {
      onSaveEditTime(time);
    } else {
      items[index] = time;
      itemsCountSaved.setData(items.length);
      print('items: ${items.length}}');
       onSaveListTimes!(items);
    }

  }

  onDeleteAction(AddFocusAttendanceTimeParams time) {
    items.remove(time);
    itemsStream.setData(items);
  }

  showDeleteDialog(BuildContext context,
      {required AddFocusAttendanceTimeParams time}) {
    return DialogsManager.showAlertDialogConfirm(
      context: context,
      title: strings.delete_time,
      message: strings.are_you_sure_delete_time,
      onConfirm: () {
        onDeleteTime!(time.id!);
      },
      confirmText: strings.ok_button,
    );
  }

  onAddAnotherTime(BuildContext context){
    if(formKey.currentState!.validate()){
      if(!checkIfAnyTimeIsNull()){
        items.add(AddFocusAttendanceTimeParams(
          focusPointId: focusPointId,
          shiftId: shift.id,
        ));

        initiallyExpanded = true;
        itemsStream.setData(items);
      }else{
        SnackBarManager.showErrorSnackBar(
          context,
          strings.saved_focus_point_time_dec,
        );

      }

    }
  }
  bool checkIfAnyTimeIsNull(){
    for(int i = 0; i < items.length; i++){
      if(items[i].startTime == null || items[i].endTime == null || items[i].attendanceTypeId == null ){
        return true;
      }
    }
    return false;
  }

   deleteIfAnyTimeIsNull(){
    for(int i = 0; i < items.length; i++){
      if(items[i].startTime == null || items[i].endTime == null || items[i].attendanceTypeId == null ){
        items.remove(items[i]);
        itemsStream.setData(items);
      }
    }
  }
  onExpansionChanged(bool value){
    initiallyExpanded = value;
    if (value && items.isEmpty) {
      items.add(AddFocusAttendanceTimeParams(
        focusPointId: focusPointId,
        shiftId: shift.id,
      ));
      itemsStream.setData(items);
    } else if (value == false) {
      deleteIfAnyTimeIsNull();
    }
  }
}
