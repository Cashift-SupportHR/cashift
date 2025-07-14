import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/punishments/presentation/punishments/pages/punishments_page.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget.dart';
import '../../../domain/entities/punishments_status.dart';
import '../../addPunishment/pages/add_punishment_page.dart';


class PunishmentsTabs extends BaseStatelessWidget {
   PunishmentsTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.punishments,
      body: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              TitleAndAddNewRequest(
                title: strings.punishments,
                textButton: strings.add_new_punishment,
                onTap: () {
                  AddPunishmentPage.push(context, onSuccess: () {
                    setState(() {});
                  });
                },
              ),
              Expanded(
                child: TabBarViewWidget(
                  tabs: [
                    strings.active_f,
                    strings.inactive_f,
                  ],

                  children: [
                    PunishmentsPage(
                      type: PunishmentsStatus.active,
                    ),
                    PunishmentsPage(
                      type: PunishmentsStatus.inactive,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
