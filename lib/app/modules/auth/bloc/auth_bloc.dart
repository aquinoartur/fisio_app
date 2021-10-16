import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'auth_events.dart';
import 'auth_states.dart';
import '../repository/google_signin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(EmptyState()) {
    on<GoogleLoginEvent>(loginWithGoogle);
    on<LoginEvent>(loginWithFirebase);
    on<PersistentLoginEvent>(persistentLoginWithFirebase);
    on<LogoutEvent>(logoutWithFirebase);
  }

  Future<void> loginWithGoogle(GoogleLoginEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await GoogleSignInRepository.login();

      if (user != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await user.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(authCredential);
        final User? firebaseUser = authResult.user;
        firebaseUser != null ? emit(GoogleLoginState(firebaseUser)) : null;
        Modular.to.navigate('/home');
      } else {
        showToastError('Falha ao realizar login');
      }
    } catch (e) {
      showToastError('Falha');
    }
  }

  Future<void> loginWithFirebase(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password);

      emit(LoginState(user: user));
      Navigator.of(event.context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToastError('Nenhum usuário encontrado para este email.');
      } else if (e.code == 'wrong-password') {
        showToastError('Senha incorreta.');
      }
    }
  }

  Future<void> persistentLoginWithFirebase(PersistentLoginEvent event, Emitter<AuthState> emit) async {
    emit(PersistentLoginState(user: event.user));
  }

  //logout
  Future<void> logoutWithFirebase(LogoutEvent event, Emitter<AuthState> emit) async {
    await FirebaseAuth.instance.signOut();
    emit(LogoutState());
    Modular.to.navigate('/login');
  }

  Future<void> logoutWithGoogle(LogoutEvent event, Emitter<AuthState> emit) async {
    await GoogleSignInRepository.logout();
  }

  //dispose
  @override
  Future<void> close() {
    return super.close();
  }
}
