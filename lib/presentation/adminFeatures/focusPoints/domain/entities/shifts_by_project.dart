
import '../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../data/models/shifts_by_project_dto.dart';

class ShiftsByProject {
  int? id;
  int? companyId;
  int? jobId;
  int? projectId;
  String? projectName;
  String? shiftName;

  ShiftsByProject({this.id, this.companyId, this.jobId, this.projectId, this.projectName, this.shiftName});

   factory ShiftsByProject.fromJson(ShiftsByProjectDto json){
      return ShiftsByProject(
        id: json.id,
        companyId: json.companyId,
        jobId: json.jobId,
        projectId: json.projectId,
        projectName: json.projectName,
        shiftName: json.shiftName,
      );
   }

   static toItemsListPicker(List<ShiftsByProject> json) {
     return json.map((e) =>
         Item(
           index: e.id ?? 0,
           value: e.shiftName!,
         )).toList();
   }
}

