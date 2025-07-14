import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/punishments/presentation/punishments/pages/punishments_screen.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../domain/entities/punishment.dart';
import '../bloc/punishments_cubit.dart';


class PunishmentsPage extends BaseBlocWidget<
    Initialized<List<Punishment>>, PunishmentsCubit> {
  final int type;

  PunishmentsPage({Key? key, required this.type})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  void loadInitialData(context) {
    bloc.fetchPunishments(type);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<Punishment>> state) {
    return PunishmentsScreen(
      punishments: state.data,
      type: type,
      onRefresh: () {
        loadInitialData(context);
      },
      onActivate: (id) {
        bloc.activePunishment(id);
      },
      onDelete: (id) {
        bloc.deletePunishment(id);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }
}
