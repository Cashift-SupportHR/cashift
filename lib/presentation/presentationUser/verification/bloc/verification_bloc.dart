import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shiftapp/data/models/auth/confirm_otp_params.dart';
import 'package:shiftapp/data/repositories/login/auth_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/core/utils/secure_storage.dart';
import 'dart:developer' as developer;
part 'verification_event.dart';

@Injectable()
class VerificationBloc extends Bloc<VerificationEvent, CommonState> {
  final AuthRepository _authRepository;
  final SecureStorage _secureStorage =SecureStorage() ;

  VerificationBloc(this._authRepository) : super(UnInitState()){
    on<VerificationEvent>((event, emit) async {
      try {
        await for (final newState in event.applyAsync(currentState: state, bloc: this)) {
          emit(newState);
        }
      } catch (error, stackTrace) {
        developer.log('$error',
            name: 'VerificationBloc', error: error, stackTrace: stackTrace);
        emit(state);
      }
    });
  }
  // @override
  // Stream<CommonState> mapEventToState(
  //     VerificationEvent event,
  //     ) async* {
  //   try {
  //     yield* event.applyAsync(
  //         currentState: state, bloc: this);
  //   } catch (_, stackTrace) {
  //     developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
  //     yield state;
  //   }
  // }

}