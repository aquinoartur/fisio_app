import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisio_app/app/design_system/snackbars/fisio_snackbars.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_events.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(EmptyState()) {
    on<GoogleLoginEvent>(loginWithGoogle);
    on<LoginEvent>(loginWithFirebase);
    on<LogoutEvent>(logoutWithFirebase);
  }

  Future<void> loginWithGoogle(
      GoogleLoginEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await GoogleSignInRepository.login();

      if (user != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await user.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        final User? firebaseUser = authResult.user;
        firebaseUser != null ? emit(GoogleLoginState(user)) : null;
        Modular.to.pushReplacementNamed('/home');
      } else {
        showToastError('Falha ao realizar login');
      }
    } catch (e) {
      showToastError('Falha');
    }
  }

  Future<void> loginWithFirebase(
      LoginEvent event, Emitter<AuthState> emit) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);

      emit(LoginState(user: user));

      Modular.to.pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToastError('Nenhum usuário encontrado para este email.');
      } else if (e.code == 'wrong-password') {
        showToastError('Senha incorreta.');
      }
    }
  }

  Future<void> logoutWithFirebase(
      LogoutEvent event, Emitter<AuthState> emit) async {
    await FirebaseAuth.instance.signOut();
    Modular.to.navigate('/login');
  }

  Future<void> logoutWithGoogle(
      LogoutEvent event, Emitter<AuthState> emit) async {
    await GoogleSignInRepository.logout();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

class GoogleSignInRepository {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.disconnect();
}
