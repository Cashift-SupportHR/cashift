import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/add/vehicle_components/widget/upload_image.dart';
import 'package:shiftapp/core/utils/app_utils.dart';

import '../../../../../../../shared/components/app_cupertino_button.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../data/models/add_image_and_descriptions_components_prams.dart';
import '../../../../../domain/entities/index.dart';

class VehicleAddNote extends BaseStatelessWidget {
  final int handoverId;
  final int vehicleComponentId;
  final VehicleComponents initialData;
  final bool isEdit;
  Function(AddImageAndDescriptionsComponentsPrams, File? file) onUpdateData;
  Function(AddImageAndDescriptionsComponentsPrams, File? file) onAddYes;
  StreamState<bool> addStream;

  VehicleAddNote({
    super.key,
    required this.onAddYes,
    required this.handoverId,
    required this.vehicleComponentId,
    required this.initialData,
    required this.onUpdateData,
    required this.isEdit,
    required this.addStream,
  });

  TextEditingController descrtiptionController = TextEditingController();
  bool isUpdateButton = false;
  @override
  Widget build(BuildContext context) {
    _initialData(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildTextFieldItem(
          title: strings.write_your_notes_here,
          hintText: initialData.description,
          controller: descrtiptionController,
          keyboardType: TextInputType.text,
          minLines: 4,
          onChanged: (value) {
            descrtiptionController.text = value;
            initialData.isTrueAndSubmitted = false;
            onUpdateDataChanged();
          },
        ),
        UploadImage(
          initialValue: initialData.image ?? "",
          onPicker: (filesValue) {
            initialData.image = filesValue.path;
            initialData.isTrueAndSubmitted = false;
            onUpdateDataChanged();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: StreamBuilder<bool>(
            initialData: initialData.isTrueAndSubmitted,
            stream: addStream.stream,
            builder: (context, snapshot) {
              print("isTrueAndSubmitted snapshot.data ${initialData.isTrueAndSubmitted}");
              return SizedBox(
                width: 100,
                child: AppCupertinoButton(
                  height: 40,
                  onPressed: () {
                    if (initialData.image == null || initialData.image == "") {
                      showErrorDialog(strings.download_image_file, context);
                    } else {
                      onAddYes(
                        AddImageAndDescriptionsComponentsPrams(
                          ComponentStatus: true,
                          custodyStatus: true,
                          IssueDescription: descrtiptionController.text,
                          VehicleComponentId: vehicleComponentId,
                          VehicleHandoverId: handoverId,
                          VehicleCustodyId: initialData.id ?? 0,
                        ),
                        File(initialData.image ?? ""),
                      );
                    }
                  },
                  text: isUpdateButton == true
                      ? strings.update_button
                      : strings.save_button,
                  elevation: 0,
                  backgroundColor: isUpdateButton ? kOrange00 : kPrimary,
                  radius: BorderRadius.circular(5),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _initialData(BuildContext context) {
      if (isEdit || initialData.isTrueAndSubmitted == true) {
        descrtiptionController.text = initialData.description ?? "";
      }
      isUpdateButton = descrtiptionController.text.isNotEmpty || (initialData.image != null && initialData.image!.isNotEmpty);
  }

  onUpdateDataChanged() {
    onUpdateData(
      AddImageAndDescriptionsComponentsPrams(
        ComponentStatus: true,
        custodyStatus: true,
        IssueDescription: descrtiptionController.text,
        VehicleComponentId: vehicleComponentId,
        VehicleHandoverId: handoverId,
        VehicleCustodyId: initialData.id ?? 0,
      ),
      File(initialData.image ?? ""),
    );
  }
}
