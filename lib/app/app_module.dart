import 'package:flutter_modular/flutter_modular.dart';
import 'core/core.dart';
import 'modules/auth/bloc/auth_bloc.dart';
import 'modules/auth/pages/login_screen.dart';
import 'modules/home/home_module.dart';
import 'modules/others/about_the_app/about_screen.dart';
import 'modules/others/splash/splash_screen.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthBloc()),
    Bind.lazySingleton((i) => FisioThemeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen()),
    ChildRoute('/login', child: (_, __) => LoginScreen(), transition: TransitionType.fadeIn),
    ModuleRoute('/home', module: HomeModule()),
    ChildRoute(
      '/about',
      child: (_, __) => AboutScreen(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 1),
    ),
  ];
}
