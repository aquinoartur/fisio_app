import 'package:fisio_app/app/modules/auth/repository/google_signin_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/auth_bloc.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => GoogleSignInDatasource(), export: true),
        Bind.singleton((i) => GoogleSignInRepository(i()), export: true),
        Bind.lazySingleton((i) => AuthBloc(i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [];
}
