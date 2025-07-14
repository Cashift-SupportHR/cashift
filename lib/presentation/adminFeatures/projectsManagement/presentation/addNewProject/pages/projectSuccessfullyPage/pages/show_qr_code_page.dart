import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../../../presentationUser/attendance/facerecognation/index.dart';
import '../../../../../../../../common/components/files/file_view_screen.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';
import '../../../bloc/project_successfully_bloc.dart';

class ShowQrCodePage extends BaseBlocWidget<
    Initialized<DownLoadFileDto>, ProjectSuccessfullyCubit> {
  ShowQrCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Future<void> loadInitialData(BuildContext context) async {
    ProjectManagement item = getArguments(context);
    bloc.showQrCode(item.id.toString() ?? '', item.nameEn ?? '');
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
  String title(context) => strings.vision_qr_code;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<DownLoadFileDto> state) {
    return FileViewScreen(
      data: state.data,
      isShowShareAndDownloadButtons: true,
      onDownload: () {
        bloc.downLoadQrCode(data: state.data);
      },
      onShare: () {
        bloc.shareQrCode(data: state.data);
      },
    );
  }

  @override
  void buildListener(BuildContext context, state) async {
    super.buildListener(context, state);
    if (state is SuccessStateListener<List<XFile>>) {
      await Share.shareXFiles(
        state.data ?? [],
      );
    }
  }
}
