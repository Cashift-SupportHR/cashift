import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../presentationUser/common/common_state.dart';
import '../../../../../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../../../../../common/components/tabview/dynamic_tab_bar_view.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../data/models/index.dart';
import '../../../../../../domain/entities/index.dart';
import '../../../../bloc/add_new_employees_bloc.dart';
import 'emp_file_screen.dart';

class EmployeeFilePage extends BaseBlocWidget<Initialized<List<TabCashifter>>,
    AddNewEmployeesCubit> {
  final Function()? onPrevious;
  final Function()? onNext;
  final int freelancerId;
  final bool isEdit;

  EmployeeFilePage({
    Key? key,
    required this.freelancerId,
    this.onNext,
    required this.isEdit,
    this.onPrevious,
  }) : super(key: key);

  int? tabIndex;
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAttachmentsTabs(freelancerId: freelancerId);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  String? title(BuildContext context) {
    return isEdit == true ? strings.attachments : null;
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<TabCashifter>> state) {
    return DynamicTabBarView(
      isSeparate: true,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      marginTabs: const EdgeInsets.symmetric(horizontal: 16),
      tabs:
          state.data.map((e) => DynamicItem(name: e.name!, id: e.id!)).toList(),
      onTap: (index) {
        tabIndex = index;
        bloc.fetchAttachments(statusCode: tabIndex, freelancerId: freelancerId);
      },
      pageWidget: StreamStateWidgetV2<List<AttachmentsEmp>?>(
          stream: bloc.attachmentsEmpStream,
          onReload: () {
            // bloc.fetchAttachments(statusCode:  tabIndex,freelancerId: freelancerId);
            loadInitialData(context);
          },
          builder: (context, snapshot) {
            return EmployeeFileScreen(
                onPrevious: () => onPrevious!(),
                onAcceptOrRejectAttachment: (acceptOrRejectAttachmentEmpPrams) {
                  bloc.acceptOrRejectAttachmentEmp(acceptOrRejectAttachmentEmpPrams: acceptOrRejectAttachmentEmpPrams);
                },
                typeIndex: tabIndex ?? 1,
                freelancerId: freelancerId,
                onAddEditFile: (requirementAttachmentPrams, file) {
                  bloc.addEditFreelancerAttachmentAdmin(
                      requirementAttachmentPrams: requirementAttachmentPrams,
                      file: file);
                },
                isEdit: isEdit,
                onNext: () => onNext!(),
                data: snapshot ?? []);
          }),
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchAttachments(freelancerId: freelancerId,statusCode:tabIndex??1 );
  }
}
