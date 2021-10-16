import 'package:fisio_app/app/modules/others/bottom_pages/profile_screen.dart';

import '../favorites/pages/favorites_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const ProfileScreen(),
      transition: TransitionType.rotate,
    ),
    ChildRoute('/favorites',
        child: (_, __) => FavoritesScreen(), transition: TransitionType.rotate, duration: const Duration(seconds: 2)),
  ];
}
