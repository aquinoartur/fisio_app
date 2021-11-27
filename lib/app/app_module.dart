import 'package:fisio_app/app/modules/auth/auth_module.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/theme/fisio_theme_controller.dart';
import 'modules/auth/view/login_screen.dart';
import 'modules/home/home_module.dart';
import 'modules/others/about_the_app/about_screen.dart';
import 'modules/others/splash/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => FisioThemeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen(authBloc: Modular.get<AuthBloc>())),
    ChildRoute('/login',
        child: (_, __) => LoginScreen(authBloc: Modular.get<AuthBloc>()), transition: TransitionType.fadeIn),
    ModuleRoute('/home', module: HomeModule()),
    ChildRoute(
      '/about',
      child: (_, __) => AboutScreen(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 1),
    ),
  ];
}
