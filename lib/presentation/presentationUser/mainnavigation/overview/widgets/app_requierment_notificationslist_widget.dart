import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
 import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
 import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
 import 'package:shiftapp/common/data/models/activity_log/index.dart';

import '../../../../../common/domain/entities/required_tasks/in_app_required_task.dart';
import '../../../../../main_index.dart';
import '../../../common/common_state.dart';
 import 'app_requirement_notification_widget.dart';
import 'applied_opportunity_section.dart';
import 'start_soon_shift_widget.dart';


class AppRequirementNotificationListWidget extends BaseStatelessWidget{
 final StreamState<List<InAppRequiredTask>> inAppNotificationStream;
 final StreamState<AppliedOffer> currentShift;

 final Function onUpdate ;
 final Function(ConfirmActivityParams params) onRequestEvent ;

  AppRequirementNotificationListWidget({required this.inAppNotificationStream, required this.onUpdate , required this.onRequestEvent , required this.currentShift});
  @override
  Widget build(BuildContext context) {
    return inAppRequirementNotification(context);
  }

  Widget inAppRequirementNotification(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<List<InAppRequiredTask>>(
          stream: inAppNotificationStream.stream,
          builder: (context, snapshot) {
            final notification = snapshot.data;
            if(notification!=null){
              return ListView.builder(
                itemCount: notification.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  if (notification[index].isAdmin != true) {
                    if(notification[index].requiredConfirmStartSoonShift() && notification[index].toAppliedOffer()!=null ){
                      final startSoonShift = notification[index].toAppliedOffer();
                      return StartSoonShiftWidget(
                        shift: startSoonShift!,
                        onConfirm: (LocationData location) {
                          onRequestEvent(ConfirmActivityParams(
                              longitude: location.longitude,
                              latitude: location.latitude,
                              id: startSoonShift.id,
                              statusId: ConfirmActivityStatus.ApproveFromHome));
                        },
                        onReject: (String message) {
                          onRequestEvent(ConfirmActivityParams(
                              description: message,
                              id: startSoonShift.id,
                              statusId: ConfirmActivityStatus.Reject));
                        },
                      );
                                    }
                    else if(notification[index].requiredBankAccount()){
                      return InAppRequirementNotification(
                          buttonName: strings.add,
                          message: strings.add_your_bank_account_now,
                          onSubmit: () async {
                            final update = await Navigator.pushNamed(
                                context, Routes. bankAccountPage);
                            if (update is bool && update == true) {
                              onUpdate();
                            }
                          });
                    }
                    else if(notification[index].requiredCv()){
                      return  InAppRequirementNotification(
                          buttonName: 'تحديث',
                          message: 'من فضلك قم بتحديث سيرتك الذاتية',
                          onSubmit: () async {
                            final update = await Navigator.pushNamed(
                                context, Routes.cv);
                            if (update is bool && update == true) {
                              onUpdate();
                            }
                          }
                      );
                                    }
                    else if(notification[index].requiredFavoritesProjects()){
                      return selectFavoriteJobs(context);
                    }
                    else{
                     return notification[index].message != null && notification[index].message!.isNotEmpty ? InAppRequirementNotification(
                       buttonName:  notification[index].actionName ?? '',
                          message: notification[index].message ?? '',
                       onSubmit: (notification[index].hasAction ?? false) ? () async {
                         if(notification[index].routeName != null && notification[index].routeName!.isNotEmpty) {
                           Navigator.pushNamed(context, notification[index].routeName ?? '');
                         }
                       } : null,
                      ) : SizedBox();
                    }
                  }
                }
              );
            }
            return Center();

          }
        ),
        buildAppliedOfferSection(currentShift.stream),
      ],
    );
  }


  Widget selectFavoriteJobs(BuildContext context) {
   return InAppRequirementNotification(
     message: strings.favorite_projects_not_selected,
     buttonName: strings.select_favorite_projects,
     onSubmit: () async {
       final selected =
       await Navigator.pushNamed(context, Routes.favoriteProjectsPage);
       if (selected is bool && selected == true) {
         onUpdate();
       }
     },
   );
 }
 /** Current shift widget **/
 Widget buildAppliedOfferSection(Stream<AppliedOffer> stream) {
   return AppliedOpportunitSection(
     onRefresh: onUpdate,
     stream: stream,
   );
 }

}