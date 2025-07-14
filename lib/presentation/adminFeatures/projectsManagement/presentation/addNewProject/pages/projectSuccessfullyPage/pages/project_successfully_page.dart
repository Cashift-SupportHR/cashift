import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';
import '../../../bloc/project_successfully_bloc.dart';
import 'project_successfully_screen.dart';

 class ProjectSuccessfullyPage
    extends BaseBlocWidget<Initialized<ProjectManagement>, ProjectSuccessfullyCubit>{
   ProjectSuccessfullyPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    int? projectId = getArguments(context) as int?;
    bloc.fetchProjectDataById(projectId ?? 0);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

   @override
   bool initializeByKoin() {
     return false;
   }

  @override
  String?  title(context)=> '';

  @override
  Widget? leading(context)=> CloseButton(color: kFontDark);

  @override
  bool isDivider(context)=> false;

  @override
  Widget buildWidget(BuildContext context, Initialized<ProjectManagement> state) {
    return  ProjectSuccessfullyScreen(
        project: state.data,
      onShareQrCodeImage: (){
          bloc.shareQrCode(projectCode: state.data.projectCode ?? '', projectName: state.data.nameAr ?? '');
      },
      onDownLoadQrCodeImage: (){
        bloc.downLoadQrCode(projectCode: state.data.projectCode ?? '', projectName: state.data.nameAr ?? '');
      },
    );
  }

  @override
  void buildListener(BuildContext context, state) async{
    super.buildListener(context, state);
    if (state is SuccessStateListener<List<XFile>>) {
      final result =  await Share.shareXFiles(
        state.data ?? [],
      );

      if (result.status == ShareResultStatus.success) {
        print("Shared successfully!");
      } else {
        print("Sharing failed!");
      }
    }
  }
}
