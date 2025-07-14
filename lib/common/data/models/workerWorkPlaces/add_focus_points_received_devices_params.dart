
import 'package:json_annotation/json_annotation.dart';

part 'add_focus_points_received_devices_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class AddFocusPointsReceivedDevicesParams {
  @JsonKey(name: 'freeLanceApplyFocusPointsId')
  int? freeLanceApplyFocusPointsId;
  @JsonKey(name: 'focusPointsDeviceSettingId')
  int? focusPointsDeviceSettingId;
  @JsonKey(name: 'haveComment')
  int? haveComment;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'attachmentFile')
  String? attachmentFile;
  @JsonKey(name: 'descriptionAttachment')
  String? descriptionAttachment;

  AddFocusPointsReceivedDevicesParams({this.freeLanceApplyFocusPointsId, this.focusPointsDeviceSettingId, this.haveComment, this.description, this.attachmentFile, this.descriptionAttachment});

   factory AddFocusPointsReceivedDevicesParams.fromJson(Map<String, dynamic> json) => _$AddFocusPointsReceivedDevicesParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddFocusPointsReceivedDevicesParamsToJson(this);
}

