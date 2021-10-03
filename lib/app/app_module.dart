import 'blocs/auth_bloc.dart';
import 'modules/bottom_pages/references_screen.dart';
import 'modules/others/about_screen.dart';
import 'modules/profile/profile_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/auth/pages/login_screen.dart';
import 'modules/others/splash_screen.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen()),
    ModuleRoute('/profile',
        module: ProfileModule(), transition: TransitionType.fadeIn),
    ChildRoute('/login',
        child: (_, __) => LoginScreen(), transition: TransitionType.fadeIn),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/favorite', module: HomeModule()),
    ChildRoute('/references', child: (_, __) => const ReferencesScreen()),
    ChildRoute(
      '/about',
      child: (_, __) => AboutScreen(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 1),
    ),
  ];
}
