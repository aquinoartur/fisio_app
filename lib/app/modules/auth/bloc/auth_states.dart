import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthState {}

class EmptyState extends AuthState {}

class LoginState extends AuthState {
  final UserCredential user;
  LoginState({
    required this.user,
  });
}

class GoogleLoginState extends AuthState {
  final GoogleSignInAccount user;

  GoogleLoginState(this.user);
}

class LogoutState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  ErrorState({
    required this.message,
  });
}
