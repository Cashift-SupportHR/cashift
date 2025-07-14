import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/common/data/repositories/projects/projects_repository.dart';
import 'package:shiftapp/common/domain/entities/projects/project.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
@Injectable()
class FavoriteProjectsCubit extends BaseCubit {
  final ProjectsRepository projectsRepository ;
  FavoriteProjectsCubit(this.projectsRepository);

  final _projectsStreamController = BehaviorSubject<List<Project>>();
  Stream<List<Project>> get projectsListStream => _projectsStreamController.stream;

   List<Project> projects = [];

  Future<void> loadProjects() async {
    try{
      emit(LoadingState());
      final projectsDto =await projectsRepository.fetchProjects();
      final favoriteProjects =await projectsRepository.fetchFavoriteProjects();
      final favoriteProjectsIds = favoriteProjects.map((e) => e.projectId);
      projects = projectsDto.map((e) => e.builder(favoriteProjectsIds.contains(e.id))).toList();
      projects.sort((a, b) => a.favorite==true ? 0:1);
      emit(Initialized(data: projects));
    }catch(e){
      emit(ErrorState(e));
      rethrow;
    }
  }

  Future<void>  search(String text)async {
    emit(LoadingState());

    if(text.isEmpty){
      emit(Initialized(data: projects));
    }else {
      final searchResult = projects.where((element) => element.toString().contains(text)).toList();
      emit(Initialized(data: searchResult));
    }

  }

  Future<void> addFavoriteProjects(List<int> projects) async {
    try{
      emit(LoadingStateListener());
      final msg =await projectsRepository.addFavoriteProjects(projects);
      emit(SuccessStateListener(data: msg));

    }catch(e){
      emit(FailureStateListener(e));
    }
  }
}