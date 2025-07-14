import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/required_tasks/required_tasks.dart';

import '../shift/applied_offer.dart';
import '../shift/applied_offer_dto.dart';

part 'in_app_required_task.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class InAppRequiredTask {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'isRequired')
  bool? isRequired;
  @JsonKey(name: 'objects')
  dynamic objects;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'routeName')
  String? routeName;
  @JsonKey(name: 'hasAction')
  bool? hasAction;
  @JsonKey(name: 'actionName')
  String? actionName;
  @JsonKey(name: 'isDynamicForm')
  bool? isDynamicForm;
  @JsonKey(name: 'isAdmin')
  bool? isAdmin;
  @JsonKey(name: 'negativeButtonName')
  String? negativeActionName;


  InAppRequiredTask({this.type, this.objects,this.isRequired, this.message, this.routeName, this.hasAction, this.actionName, this.isDynamicForm, this.isAdmin, this.negativeActionName});

  Map<String,dynamic>? dataObject() {
    if (objects != null) {
      //  final jsonObject = jsonDecode(objects!);
      final jsonObject = objects;
      if (jsonObject is Map<String,dynamic>) {
        print('dataObject ${jsonObject}');
        return jsonObject;
      }
    }
    return null;
  }

  bool requiredFavoritesProjects(){
    return type == RequiredTasksTypes.favoriteProjects;
  }

  bool requiredBankAccount(){
    return type == RequiredTasksTypes.bankAccount;
  }
  bool requiredCv(){
    return type == RequiredTasksTypes.cv;
  }

  bool requiredStartShift(){
    return type == RequiredTasksTypes.startShift;
  }

  bool requiredConfirmStartSoonShift(){
    return type == RequiredTasksTypes.confirmStartSoonShift;
  }

  bool employeeAttendanceTime(){
    return type == RequiredTasksTypes.employeeAttendanceTime;
  }

  bool requiredDtaAttendance(){
    return type == RequiredTasksTypes.dtaAttendance;
  }

  AppliedOffer ? toAppliedOffer(){
    if(requiredStartShift()&& dataObject()!=null){
      return AppliedOfferDto.fromJson(dataObject()!).builder();
    }
    return null;
  }
  factory InAppRequiredTask.fromJson(Map<String, dynamic> json) =>
      _$InAppRequiredTaskFromJson(json);

  Map<String, dynamic> toJson() => _$InAppRequiredTaskToJson(this);
}
