import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../adminFeatures/employees/domain/entities/tab_cashifter.dart';
import '../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../common/components/tabview/dynamic_tab_bar_view.dart';
import '../../../common/common_state.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../adminFeatures/employees/domain/entities/AttachmentsEmp.dart';
import '../../../../adminFeatures/employees/presentation/addNewEmployees/bloc/add_new_employees_bloc.dart';
import '../../../../adminFeatures/employees/presentation/addNewEmployees/pages/add/emp_file/screen/emp_file_screen.dart';
import '../cubit/attachment_employees_bloc.dart';
import 'attachment_emp_screen.dart';

class EmployeeAttachmentPage extends BaseBlocWidget<
    Initialized<List<TabCashifter>>, AttachmentEmployeesCubit> {
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAttachmentsTabs();
  }

  @override
  String? title(BuildContext context) {
    return strings.attachments;
  }

  int? tabIndex;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<TabCashifter>> state) {
    return DynamicTabBarView(
      isSeparate: true,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(10),
      marginTabs: const EdgeInsets.symmetric(horizontal: 16),
      tabs:
          state.data.map((e) => DynamicItem(name: e.name!, id: e.id!)).toList(),
      onTap: (index) {
        tabIndex = index;
        bloc.fetchAttachments(
          statusCode: tabIndex,
        );
      },
      pageWidget: StreamStateWidgetV2<List<AttachmentsEmp>?>(
          stream: bloc.attachmentsEmpStream,
          onReload: () {
            loadInitialData(context);
          },
          builder: (context, snapshot) {
            return AttachmentEmpScreen(
                tabIndex: tabIndex ?? 1,
                onAddEditFileUser: (requirementAttachmentId, file) {
                  bloc.addEditFreelancerAttachmentUser(
                      requirementAttachmentId: requirementAttachmentId,
                      file: file);
                },
                data: snapshot ?? []);
          }),
    );
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchAttachments(
      statusCode: tabIndex ?? 1,
    );
  }
}
