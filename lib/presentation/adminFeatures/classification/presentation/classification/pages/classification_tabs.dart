import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';

import '../../../../../presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget.dart';

import '../../../../projectsManagement/domain/entities/users_management_constants.dart';
import '../../addClassification/pages/add_classification_page.dart';
import 'classification_page.dart';

class ClassificationTabs extends StatefulWidget {

  ClassificationTabs({Key? key}) : super(key: key);

  @override
  State<ClassificationTabs> createState() => _ClassificationTabsState();
}

class _ClassificationTabsState extends State<ClassificationTabs> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations strings = AppLocalizations.of(context)!;
    return AppScaffold(
      title: strings.classification,
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.classification,
            textButton: strings.add_classification,
            onTap: () {
              AddClassificationPage.push(context, onSuccess: () {
                setState(() {});
              });
            },
          ),
          Expanded(
            child: TabBarViewWidget(
              isSeparate: true,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              marginTabs: const EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                strings.active,
                strings.inactive,
              ],
              children: [
                ClassificationPage(
                  type: UsersManagementConstants.active,
                ),
                ClassificationPage(
                  type: UsersManagementConstants.inactive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
