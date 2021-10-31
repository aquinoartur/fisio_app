import 'package:fisio_app/app/modules/favorites/favorite_module.dart';
import 'package:fisio_app/app/modules/home/fisio_router_outlet.dart';
import 'package:fisio_app/app/modules/others/references/references_screen.dart';
import 'package:fisio_app/app/modules/others/youtube_player/youtube_player_list.dart';
import 'package:fisio_app/app/modules/others/youtube_player/youtube_player_screen.dart';
import 'package:fisio_app/app/modules/profile/profile_module.dart';

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
      child: (_, __) => const FisioRouterOutlet(),
      transition: TransitionType.fadeIn,
      children: [
        ChildRoute('/home-screen', child: (_, __) => const HomeScreen(), transition: TransitionType.fadeIn),
        ChildRoute('/category', child: (_, args) => CategoryScreen(args.data), transition: TransitionType.leftToRight),
        ChildRoute('/test', child: (_, args) => TestScreen(args.data), transition: TransitionType.leftToRight),
        ModuleRoute('/favorites', module: FavoriteModule(), transition: TransitionType.fadeIn),
        ChildRoute('/youtube-player', child: (_, __) => YoutubePlayerScreen()),
        ChildRoute('/youtube-player-list', child: (_, __) => YoutubePlayerVideoList()),
        //bottom-pages
        ChildRoute('/references', child: (_, args) => const ReferencesScreen(), transition: TransitionType.fadeIn),
        ModuleRoute('/profile', module: ProfileModule(), transition: TransitionType.fadeIn),
      ],
    ),
  ];
}
