import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_components/widget/vehicle_add_note.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/decorations/decorations.dart';
import '../../../../../../../../common/components/radio/radio_grid_list.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../data/models/add_image_and_descriptions_components_prams.dart';
import '../../../../../domain/entities/vehicleComponents.dart';

class VehicleComponentsItem extends BaseStatelessWidget {
  final VehicleComponents vehicleComponents;
  final int handoverId;
  final bool isEdit;
  StreamState<bool> addStream;

  Function(VehicleComponents, bool status) onChangeStatus;
  Function(AddImageAndDescriptionsComponentsPrams, File?) onAddYes;

  VehicleComponentsItem({
    super.key,
    required this.vehicleComponents,
    required this.handoverId,
    required this.onChangeStatus,
    required this.onAddYes,
    required this.addStream,
    required this.isEdit,
  });

  StreamState<bool> showData = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    initData();
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(8),
      decoration: Decorations.decorationTabs,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vehicleComponents.name ?? "",
            style: kTextRegular.copyWith(fontSize: 14),
          ),
          RadioGridList(
            crossAxisCount: 3,
            items: [
              RadioItem(title: strings.no, id: "false", value: "false"),
              RadioItem(title: strings.yes, id: "true", value: "true"),
            ],
            onChanged: (data) {
              if (data.id == "true") {
                showData.setData(true);
                // because addStream is used in the parent widget so we need to update it.
                if(vehicleComponents.isTrueAndSubmitted == true){
                  addStream.setData(true);
                } else {
                  addStream.setData(false);
                }
              } else {
                vehicleComponents.isTrueAndSubmitted = false;
                vehicleComponents.description = '';
                vehicleComponents.image = '';
                showData.setData(false);
                addStream.setData(false);
              }
              vehicleComponents.status = data.id == "true";
              onChangeStatus(vehicleComponents, data.id == "true");
            },
            groupValue: vehicleComponents.status?.toString() ?? '',
          ),
          StreamBuilder<bool>(
            stream: showData.stream,
            builder: (context, snapshot) {
              return snapshot.data == null || snapshot.data == false
                  ? SizedBox()
                  : VehicleAddNote(
                      initialData: vehicleComponents,
                      handoverId: handoverId,
                      addStream: addStream,
                      isEdit: isEdit,
                      vehicleComponentId: vehicleComponents.id ?? 0,
                      onUpdateData: (params, file) {
                        // Because when the user scroll the list the data will be lost so we need to save it
                        onUpdateDataChanged(params, file);
                      },
                      onAddYes: (params, file) {
                        onAddYes(params, file);
                        // showData.setData(false);
                        // Because when the user scroll the list the data will be lost so we need to save it
                        vehicleComponents.isTrueAndSubmitted = true;
                        onUpdateDataChanged(params, file);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }

  onUpdateDataChanged(
      AddImageAndDescriptionsComponentsPrams params, File? file) {
    vehicleComponents.status = true;
    vehicleComponents.image = file?.path ?? "";
    vehicleComponents.description = params.IssueDescription ?? '';
    onChangeStatus(vehicleComponents, true);
  }

  void initData() {
    showData.setData(vehicleComponents.status ?? false);
    addStream.setData(vehicleComponents.isTrueAndSubmitted ?? false);
  }
}
