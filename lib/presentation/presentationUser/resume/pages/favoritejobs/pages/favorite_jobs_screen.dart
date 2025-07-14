import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shiftapp/core/resources/data_state.dart';
import 'package:shiftapp/common/domain/entities/resume/experiences_info.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/presentation/presentationUser/resume/widgets/base_resume_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resume/widgets/selectable__widgets.dart';
import 'package:shiftapp/common/components/loading_widget.dart';


class FavoriteJobsScreen extends BaseResumeWidget<DataState<FavoriteJobsInfo>> {

  final Function(List<int> favJobs) onSubmit;
  final bool isMale;

  FavoriteJobsScreen(
      {Key? key,
      required ResumeComponentData resumeComponentData,
      required ScrollController controller,
      required this.isMale,
      Function? onBack,
      required this.onSubmit})
      : super(
            key: key,
            onBack: onBack,
            resumeComponentData: resumeComponentData,
            controller: controller,
            isLastStep: true);

  List<int> favJobs = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget buildResumeWidget(
      BuildContext context, DataState<FavoriteJobsInfo>? state) {

    if(state is DataSuccess){
      {

        final favoriteJobsInfo =  state!.data!;
        favJobs = favoriteJobsInfo.getSelectedJobsIndexes();
        validate();

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  strings.favorite_jobs,
                  style: labelStyle,
                ),
                SizedBox(
                  height: 16
                ),
                MultiSelectableListWidget(
                  items: favoriteJobsInfo.getJobs(),
                  controller: controller,
                  initIndexes: favoriteJobsInfo.getSelectedJobsIndexes(),
                  onSelect: (indexes) {
                    favJobs.clear();
                    for (var element in indexes) {
                      favJobs.add(favoriteJobsInfo.jobs[element].id!);
                    }
                    validate();
                  },
                ),
              ],
            ),
          ),
        );
      }
    }
    return const LoadingView();
  }

  @override
  validate() {
    validateForm(favJobs.isNotEmpty);
  }

  @override
  onClickSubmit() {
    onSubmit(favJobs);
  }

  @override
  void loadInitialData(ResumeBloc bloc) {
    print('loadInitialData $isMale');
    bloc.add(FetchJobs(isMale: isMale));
  }

  @override
  Stream<DataState<FavoriteJobsInfo>> setStream() {
    return resumeBloc!.experiencesInfoStream.stream;
  }
}
