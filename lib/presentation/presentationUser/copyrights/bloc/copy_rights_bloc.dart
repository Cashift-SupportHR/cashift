import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/repositories/terms/terms_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

part 'copy_rights_events.dart';
@Injectable()
class CopyRightsBloc extends Bloc<CopyRightsEvent, CommonState> {
  // use GetIt for DI in projct

  final TermsRepository _termsRepository;
  CopyRightsBloc(this._termsRepository) : super(UnInitState()){
    on<CopyRightsEvent>((event, emit) async {
      try {
        await for (final newState in event.applyAsync(currentState: state, bloc: this)) {
          emit(newState);
        }
      } catch (error, stackTrace) {
        developer.log('$error', name: 'CopyRightsBloc', error: error, stackTrace: stackTrace);
        emit(state);
      }
    });
  }



  @override
  Future<void> close() async {
    await super.close();
  }

  // @override
  // Stream<CommonState> mapEventToState(
  //     CopyRightsEvent event,
  //     ) async* {
  //   try {
  //     yield* event.applyAsync(
  //         currentState: state, bloc: this);
  //   } catch (_, stackTrace) {
  //     developer.log('$_', name: 'ActivityLogBloc', error: _, stackTrace: stackTrace);
  //     yield state;
  //   }
  // }

}
