import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../main_index.dart';
import '../../../../../common/components/texts/list_row_texts_icons_v2.dart';
import '../../data/models/user_request_dto.dart';

class UserRequest {
  int? id;
  int? cashifterRequestTypeId;
  String? cashifterRequestTypeName;
  String? oldPhoneNumber;
  String? newPhoneNumber;
  String? attachmentDocument;
  String? attachmentDocumentType;
  String? description;
  String? rejectReason;
  int? cashifterRequestStatusId;
  String? cashifterRequestStatusName;
  String? shiftAdminUserId;
  String? hrAdminUserId;
  int? companyId;
  int? projectId;
  String? projectName;
  int? shiftId;
  String? shiftName;
  String? cashiftName;
  String? imagePath;

  UserRequest(
      {this.id,
      this.cashifterRequestTypeId,
      this.cashifterRequestTypeName,
      this.oldPhoneNumber,
      this.newPhoneNumber,
      this.attachmentDocument,
      this.attachmentDocumentType,
      this.description,
      this.rejectReason,
      this.cashifterRequestStatusId,
      this.cashifterRequestStatusName,
      this.shiftAdminUserId,
      this.hrAdminUserId,
      this.companyId,
      this.projectId,
      this.projectName,
      this.shiftId,
      this.shiftName,
      this.cashiftName,
      this.imagePath});

  factory UserRequest.fromJson(UserRequestDto dto) => UserRequest(
      id: dto.id,
      cashifterRequestTypeId: dto.cashifterRequestTypeId,
      cashifterRequestTypeName: dto.cashifterRequestTypeName,
      oldPhoneNumber: dto.oldPhoneNumber,
      newPhoneNumber: dto.newPhoneNumber,
      attachmentDocument: dto.attachmentDocument,
      attachmentDocumentType: dto.attachmentDocumentType,
      description: dto.description,
      rejectReason: dto.rejectReason,
      cashifterRequestStatusId: dto.cashifterRequestStatusId,
      cashifterRequestStatusName: dto.cashifterRequestStatusName,
      shiftAdminUserId: dto.shiftAdminUserId,
      hrAdminUserId: dto.hrAdminUserId,
      companyId: dto.companyId,
      projectId: dto.projectId,
      projectName: dto.projectName,
      shiftId: dto.shiftId,
      shiftName: dto.shiftName,
      cashiftName: dto.cashiftName,
      imagePath: dto.imagePath);

  static List<UserRequest> fromDtoList(List<UserRequestDto> json) {
    return json.map((e) => UserRequest.fromJson(e)).toList();
  }

  List<ListRowTextItem> toListRowTextItems(AppLocalizations strings) {
    return [
      ListRowTextItem(
        icon: AppIcons.projectName,
        title: strings.project_name,
        value: projectName ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.workingPeriodOutline,
        title: strings.working_period,
        value: shiftName ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.receiver_cashifter,
        title: strings.type_request,
        value: cashifterRequestTypeName ?? '',
      ),
      ListRowTextItem(
        icon: AppIcons.mobileOutline,
        title: strings.new_mobile_number,
        value: newPhoneNumber ?? '',
      ),
    ];
  }

  bool get isPDFFile => attachmentDocumentType == 'pdf';
}
