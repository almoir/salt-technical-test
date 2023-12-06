part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthDoLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthDoLogin(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
