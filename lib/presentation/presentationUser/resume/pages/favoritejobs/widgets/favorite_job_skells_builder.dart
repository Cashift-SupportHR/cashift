import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../../common/domain/entities/resume/job_skills.dart';
import '../../../../resources/constants.dart';
import '../bloc/favorite_job_cubit.dart';



class FavoriteJobSkillsBuilder extends
BaseBlocWidget<Initialized<List<JobSkills>>, FavoriteJobsCubit> {
  final int jobId;
  FavoriteJobSkillsBuilder({Key? key, required this.jobId}) : super(key: key);
  @override
  bool initializeByKoin() {
    return false;
  }
//   @factoryMethod
  @override
  void loadInitialData(BuildContext context) {
     bloc.fetchJobSkills(jobId);
  }
  @override
  Widget buildWidget(BuildContext context, Initialized<List<JobSkills>> state) {
    return Container(
      color: kWhite,
      height: double.infinity,
      width: double.infinity,
      child: Wrap(
        children: state.data.map((item) => Padding(
          padding: const EdgeInsets.only(right: 5, bottom: 5),
          child: Chip(
            backgroundColor: kWhite,
            side: BorderSide(color: kFontDark.withOpacity(0.3), width: 1),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            label: FittedBox(
                child: Text(item.name!, style: kTextLight.copyWith(fontSize: 10, color: kBlack.withOpacity(0.5)),)),
          ),
        )).toList(),
      ),
    );
  }
}
