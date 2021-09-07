import 'package:fisio_app/app/modules/home/pages/home_screen.dart';
import 'package:fisio_app/app/modules/home/pages/test_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    ChildRoute('/login', child: (_, __) => LoginScreen()),
    ChildRoute('/home', child: (_, __) => HomeScreen()),
    ChildRoute('/test', child: (_, args) => TestScreen(args.data)),
  ];
}
