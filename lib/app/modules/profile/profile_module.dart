import 'package:fisio_app/app/modules/bottom_pages/favorites_screen.dart';
import 'package:fisio_app/app/modules/bottom_pages/my_data_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => MyDataScreen(),
      transition: TransitionType.rotate,
    ),
    ChildRoute('/favorites',
        child: (_, __) => FavoritesScreen(),
        transition: TransitionType.rotate,
        duration: Duration(seconds: 2)),
  ];
}
