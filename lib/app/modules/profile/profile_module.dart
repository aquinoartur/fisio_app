import '../favorites/pages/favorites_screen.dart';
import '../bottom_pages/my_data_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const MyDataScreen(),
      transition: TransitionType.rotate,
    ),
    ChildRoute('/favorites',
        child: (_, __) => FavoritesScreen(),
        transition: TransitionType.rotate,
        duration: const Duration(seconds: 2)),
  ];
}
