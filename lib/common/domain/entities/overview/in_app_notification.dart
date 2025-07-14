import '../shift/applied_offer.dart';
import '../required_tasks/in_app_required_task.dart';

class InAppNotification{
  final bool requiredBankInfo ;
  final bool requiredFavoriteProjects ;
  final bool requiredCvUpdate ;
  final AppliedOffer  ? startSoonShift;
  final List<InAppRequiredTask> newMessages;

  InAppNotification(
      {required this.requiredBankInfo,
      required this.requiredFavoriteProjects,  this.startSoonShift , required this.requiredCvUpdate, required this.newMessages});



}