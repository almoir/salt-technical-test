import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthDoLogin) {
        try {
          emit(AuthLoading());
          await AuthService().doLogin(event.email, event.password);
          emit(AuthSuccess());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
