
import '../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../common/domain/entities/workerWorkPlaces/index.dart';
class MyFocusPointStatus{
  static int active = 38;
  static int notCheckedIn = 41;
  static int checkedIn = 43;
  static int waitingCheckedIn = 40;
  static int withdrawn = 42;

  static int getActiveStepper(List<WorkerWorkPlace> myGates){
    if(myGates.isEmpty){
      return 0;
    } else {
      if(myGates.any((element) => element.status == MyFocusPointStatus.active)){
        return myGates.indexWhere((element) => element.status == MyFocusPointStatus.active);
      } else if(myGates.any((element) => element.status == MyFocusPointStatus.checkedIn)){
        int index = myGates.indexWhere((element) => element.status == MyFocusPointStatus.checkedIn);
        if(index == myGates.length - 1){
          return index;
        } else {
          return index + 1;
        }
      } else {
        return 0;
      }
    }
  }
}