import 'package:fisio_app/app/modules/bottom_pages/references_screen.dart';
import 'package:fisio_app/app/modules/others/about_screen.dart';
import 'package:fisio_app/app/modules/profile/profile_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/login_screen.dart';
import 'modules/others/splash_screen.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen()),
    ModuleRoute('/profile',
        module: ProfileModule(), transition: TransitionType.fadeIn),
    ChildRoute('/login',
        child: (_, __) => LoginScreen(), transition: TransitionType.fadeIn),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/favorite', module: HomeModule()),
    ChildRoute('/references', child: (_, __) => ReferencesScreen()),
    ChildRoute('/about',
        child: (_, __) => AboutScreen(),
        transition: TransitionType.fadeIn,
        duration: Duration(seconds: 1)),
  ];
}
