import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shiftapp/core/resources/data_state.dart' as dataState;
import 'package:shiftapp/common/data/models/resuame/update_resume_params.dart';
 import 'package:shiftapp/common/data/repositories/resume/resume_repository.dart';
import 'package:shiftapp/common/data/repositories/user/user_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resume/bloc/resume_component_data.dart';
import 'package:shiftapp/common/domain/entities/resume/index.dart';


part 'resume_event.dart';
@Injectable()
class ResumeBloc extends Bloc<ResumeEvent, CommonState> {
  final ResumeRepository _resumeRepository ;
  final UserRepository _userRepository ;

  ResumeComponentData ?  resumeComponentData ;


  StreamState<EducationInfo>  educationInfoStream= StreamStateInitial() ;
  StreamState<SkillsInfo>  skillsStream= StreamStateInitial() ;
  StreamState<PersonalInfo>  personalInfoStream= StreamStateInitial() ;
  StreamState<dataState.DataState<FavoriteJobsInfo>>  experiencesInfoStream= StreamStateInitial() ;
  StreamState<List<DistrictItem>>  districtsStream= StreamStateInitial();
  StreamState<FavoriteTimeInfo>  favoriteTimesStream= StreamStateInitial();



  ResumeBloc(ResumeRepository resumeRepository ,UserRepository userRepository) : _resumeRepository = resumeRepository
  ,_userRepository = userRepository,  super(UnInitState()){
    on<ResumeEvent>((event, emit) async {
      try {
        await for (final newState in event.applyAsync(currentState: state, bloc: this)) {
          emit(newState);
        }
      } catch (_, stackTrace) {
        // developer.log('$_',
        //     name: 'ResumeBloc', error: _, stackTrace: stackTrace);
        emit(state);
      }
    });
  }

  // @override
  // Stream<CommonState> mapEventToState(
  //     ResumeEvent event,
  // ) async* {
  //   try {
  //     yield* event.applyAsync(currentState: state, bloc: this);
  //   } catch (_) {
  //     //developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
  //     yield state;
  //   }
  // }

  Future<void> fetchDistricts(int cityId) async {
    try {
      final result = await _resumeRepository.fetchDistricts(cityId);
      districtsStream.setData(result);
    } catch (e) {
      districtsStream.setError(e);
    }
  }


}
