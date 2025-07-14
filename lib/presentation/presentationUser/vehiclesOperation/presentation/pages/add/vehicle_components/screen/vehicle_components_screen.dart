import 'dart:io';
import '../../../../../../../../common/components/index.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/vehicleComponents.dart';
import '../intent/vehicle_components_intents.dart';
import '../widget/message_alart_widget.dart';
import '../widget/vehicle_components_item.dart';

class VehicleComponentsScreen extends BaseStatelessWidget {
  int handoverId;
  StreamState<bool> addStream;
  final List<VehicleComponents> vehicleComponentList;
  final Function(VehicleComponentsIntents intent) intentCallBack;



  VehicleComponentsScreen({
    super.key,
    required this.handoverId,
    required this.vehicleComponentList,
    required this.intentCallBack,
    required this.addStream,
  });

  final _keyForm = GlobalKey<FormState>();
  List<int> yesIds = [];

  @override
  Widget build(BuildContext context) {
    _initData();
    MainReceiveVehicleArg arg = getArguments(context);
    return AppScaffold(
      bottomNavigationBar: RowButtons(
        onCancel: () => intentCallBack(CancelVehicleComponents(
            vehicleComponents: vehicleComponentList,
        )),
        onSave: () {
          onSavePressed(context);
        },
        textSaveButton: strings.next_button,
        textCancelButton:   arg.isEdit ? strings.discard :
        strings.previous_button,
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              MessageAllartWidget(),
              Expanded(
                  child: ListView.builder(
                itemCount: vehicleComponentList.length,
                itemBuilder: (context, index) {
                  return VehicleComponentsItem(
                    addStream: addStream,
                    vehicleComponents: vehicleComponentList[index],
                    handoverId: handoverId,
                    isEdit: arg.isEdit,
                    onAddYes: (params, file) {
                      onAddYesPressed(params, file, index);
                    },
                    onChangeStatus: (data, status) {
                      if (status == false) {
                        yesIds.remove(data.id);
                      }
                      vehicleComponentList[index] = data;
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  _initData(){
    yesIds = VehicleComponents.getVehicleComponentIdsYES(vehicleComponentList);
  }

  void onAddYesPressed(
      AddImageAndDescriptionsComponentsPrams params, File? file, int index) {
    if (_keyForm.currentState!.validate()) {
      if (yesIds.contains(vehicleComponentList[index].id) == false){
        yesIds.add(vehicleComponentList[index].id ?? 0);
      }
      vehicleComponentList[index].isTrueAndSubmitted = true;
      intentCallBack(SubmitQuestionAnswer(addImageAndDescriptionsComponentsPrams: params,files: file));
    }
  }

  void onSavePressed(BuildContext context) {
    if (isNotValidate()) {
      showErrorDialog(strings.please_add_all, context);
    } else {
      List<int> idNo =
          VehicleComponents.getVehicleComponentIdsNO(vehicleComponentList);
      intentCallBack(SubmitVehicleComponents(AddComponentsPrams(
          vehicleHandoverId: handoverId,
          vehicleComponentsStatuses: idNo
              .map((e) => VehicleComponentsStatuse(
              componentStatus: false, vehicleComponentId: e))
              .toList()),
          vehicleComponents: vehicleComponentList

      ));
    }
  }

  bool isNotValidate() {
    bool isValidate = _keyForm.currentState!.validate();
    // check if there is any question not answered
    bool isNotValidate = vehicleComponentList.any((element) =>
        element.status == null ||
        (element.status == true && element.isTrueAndSubmitted != true));
    List<int> noIds = VehicleComponents.getVehicleComponentIdsNO(vehicleComponentList);
    // remove any id found in noIds from yesIds, Why? because wh
    bool isAllQuestionsAnswered = (noIds.length + yesIds.length) == vehicleComponentList.length;
    print('isNotValidate $isNotValidate');
    print('isValidate $isValidate');
    print('isAllQuestionsAnswered $isAllQuestionsAnswered');
    print('isAllQuestionsAnswered ${noIds.length + yesIds.length} ${vehicleComponentList.length}');
    print('isAllQuestionsAnswered ${noIds.length} -- ${yesIds.length}');
    return isNotValidate || !isValidate || !isAllQuestionsAnswered;
  }
}
