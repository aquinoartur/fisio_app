import 'pages/category_screen.dart';
import 'pages/home_screen.dart';
import 'pages/test_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const HomeScreen(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 2),
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
