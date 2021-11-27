import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInDatasource extends GoogleSignIn {}

abstract class IGoogleSignInRepository {
  Future<GoogleSignInAccount?> login();
  Future<GoogleSignInAccount?> logout();
}

class GoogleSignInRepository implements IGoogleSignInRepository {
  final GoogleSignInDatasource _googleSignIn;
  GoogleSignInRepository(this._googleSignIn);
  @override
  Future<GoogleSignInAccount?> login() {
    return _googleSignIn.signIn();
  }

  @override
  Future<GoogleSignInAccount?> logout() {
    return _googleSignIn.disconnect();
  }
}
