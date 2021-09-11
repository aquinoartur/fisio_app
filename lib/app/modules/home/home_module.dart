import 'package:fisio_app/app/modules/home/pages/category_screen.dart';
import 'package:fisio_app/app/modules/home/pages/home_screen.dart';
import 'package:fisio_app/app/modules/home/pages/test_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomeScreen(),
      transition: TransitionType.fadeIn,
      duration: Duration(seconds: 2),
    ),
    ChildRoute(
      '/test',
      child: (_, args) => TestScreen(args.data),
      transition: TransitionType.leftToRight,
    ),
    ChildRoute(
      '/category',
      child: (_, args) => CategoryScreen(args.data),
      transition: TransitionType.leftToRight,
    ),
  ];
}
