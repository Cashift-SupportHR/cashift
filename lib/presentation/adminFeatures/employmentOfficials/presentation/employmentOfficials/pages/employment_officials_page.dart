import 'package:flutter/material.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/error_handler_widget.dart';
import '../../../../../../common/components/loading_widget.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget.dart';
import '../../../domain/entities/employment_official.dart';
import '../../addEmploymentOfficial/pages/add_employment_official_page.dart';
import '../bloc/employment_officials_cubit.dart';
import 'employment_officials_screen.dart';

class EmploymentOfficialsPage extends BaseBlocWidget<Initialized<List<EmploymentOfficial>>, EmploymentOfficialsCubit> {

  EmploymentOfficialsPage({Key? key}) : super(key: key);

  String search = '';
  int typeStatus = 1;
  @override
  bool initializeByKoin() {
    return false;
  }

  TextEditingController controller = TextEditingController();
  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(context) {
    bloc.fetchInitialData(typeStatus);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFieldSearchJob(
            title: strings.search,
            readOnly: false,
            controller: controller,
            onTap: () {},
            onChanged: (value) {
              bloc.searchByText(value);
            },
          ),
        ),
        TitleAndAddNewRequest(
          title: strings.employment_officials,
          textButton: strings.add_employment_official,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          onTap: () async {
            controller.clear();
            final isRefresh = await Navigator.pushNamed(context, Routes.addEmploymentOfficialPage);
            if (isRefresh == true) {
              loadInitialData(context);
            }
          },
        ),
        SizedBox(height: 16),
        Expanded(child: TabBarViewWidget(
          isSeparate: true,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          marginTabs: const EdgeInsets.symmetric(horizontal: 16),
          onTap: (index) {
            typeStatus = index + 1;
            bloc.fetchInitialData(typeStatus);
            controller.clear();
          },
          tabs: [
            strings.active,
            strings.inactive,
          ],
          pageWidget: buildConsumer(context),
        )),
      ],
    ));
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<List<EmploymentOfficial>> state) {
    return EmploymentOfficialsScreen(
      type: typeStatus,
      data: state.data,
      onRefresh: (value) {
        onSuccessDismissed();
      },
      onDeactivate: (value) {
        bloc.deleteEmploymentOfficial(value);
      },
    );
  }

  @override
  String? title(context) => strings.employment_officials;

  @override
  onSuccessDismissed() {
    bloc.fetchInitialData(typeStatus);
    controller.clear();
  }
}
