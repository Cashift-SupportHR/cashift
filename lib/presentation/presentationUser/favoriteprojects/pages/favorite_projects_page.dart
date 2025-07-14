import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/projects/project.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/favoriteprojects/bloc/favorite_projects_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/favoriteprojects/pages/favorite_project_screen.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:sizer/sizer.dart';

class FavoriteProjectsPage
    extends BaseBlocWidget<Initialized<List<Project>>, FavoriteProjectsCubit> {
   bool update = false;
  final textController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  Widget buildWidget(BuildContext context, Initialized<List<Project>> state) {
    print('buildWidget ${state.data}');
    return FavoriteProjectsScreen(
      onSubmit: (List<int> projects) {
        updateFavorites(projects);
      },
      projects: state.data,
      onSubmitSearch: (String text) {
        search(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body:body(context)
    );
  }

  Widget body(BuildContext context){
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            elevation: 2,

            borderRadius: const BorderRadius.all(Radius.circular(27)),
            child: TextFormField(
              style: kTextMedium.copyWith(fontSize: 16),
              controller: textController,
              onChanged: (t) {
                search(t);
              },
              focusNode: focusNode,
              decoration: kSearchDecoration.copyWith(
                  suffixIcon: const Icon(Icons.search),
                  hintText: strings.search,
                  hintStyle: kTextRegular.copyWith(
                      fontSize: 10.sp, color: kBattleShipGrey)),
            ),
          ),
        ),
        Expanded(child: buildConsumer(context)),
      ],
    );
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadProjects();
  }

  @override
  String? title(BuildContext context) => strings.favorite_projects;

  void updateFavorites(List<int> projects) {
    bloc.addFavoriteProjects(projects);
  }

  @override
  void onRequestSuccess(String? message) {
    update = true;
    showSuccessMessage(message!,onDismiss: (){
      loadInitialData(context);
    });
//     update = true;
  }

  @override
  void onBackPress() {
    if (update) {
      Navigator.pop(context, update);
    } else {
      super.onBackPress();
    }
  }

  void search(String text) {
    bloc.search(text);
  }
}
