import 'view/favorites_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => FavoritesScreen(),
    ),
  ];
}
