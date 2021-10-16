import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;
  LoginEvent({
    required this.context,
    required this.email,
    required this.password,
  });
}

class PersistentLoginEvent extends AuthEvent {
  final User user;
  PersistentLoginEvent({
    required this.user,
  });
}

class GoogleLoginEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
