
import '../../../../../common/components/index.dart';
import '../../data/models/violation_employee_dto.dart';

class ViolationEmployee {
  int? id;
  int? employeeId;
  String? name;
  String? phone;
  int? shiftId;
  String? shiftName;

  ViolationEmployee({this.id, this.employeeId, this.name, this.phone, this.shiftId, this.shiftName});

   factory ViolationEmployee.fromDto(ViolationEmployeeDto json) => ViolationEmployee(
        id: json.id,
        employeeId: json.employeeId,
        name: json.name,
        phone: json.phone,
        shiftId: json.shiftId,
        shiftName: json.shiftName,
      );

    static List<ViolationEmployee> fromListDto(List<ViolationEmployeeDto> json) {
    return json.map((e) => ViolationEmployee.fromDto(e)).toList();
    }


  static toItemsListPicker(List<ViolationEmployee> json) {
    return json.map((e) =>
        Item(
          index: e.id ?? 0,
          value: e.name!,
        )).toList();
  }
}

