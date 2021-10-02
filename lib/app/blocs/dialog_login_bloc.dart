import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(EmptyState()) {
    on<LoginEvent>(loginWithGoogle);
  }

  Future<void> loginWithGoogle(
      LoginEvent event, Emitter<AuthState> emit) async {}

  @override
  Future<void> close() {
    return super.close();
  }
}

abstract class AuthState {}

class EmptyState extends AuthState {}

class LoginState extends AuthState {}

class LogoutState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  ErrorState({
    required this.message,
  });
}

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {}

class LogouEvent extends AuthEvent {}
