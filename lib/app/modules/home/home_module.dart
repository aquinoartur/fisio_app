import 'package:fisio_app/app/modules/favorites/view/favorite_db_picker_screen.dart';

import '../favorites/favorite_module.dart';
import 'fisio_router_outlet.dart';
import '../others/references/references_screen.dart';
import '../others/youtube_player/youtube_player_list.dart';
import '../others/youtube_player/youtube_player_screen.dart';
import '../profile/profile_module.dart';

import 'view/category_screen.dart';
import 'view/home_screen.dart';
import 'view/test_screen.dart';
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
        //home-childs-pages
        ChildRoute('/home-screen', child: (_, __) => const HomeScreen(), transition: TransitionType.fadeIn),
        ChildRoute('/category', child: (_, args) => CategoryScreen(args.data), transition: TransitionType.leftToRight),
        ChildRoute('/test', child: (_, args) => TestScreen(args.data), transition: TransitionType.leftToRight),
        ModuleRoute('/favorites', module: FavoriteModule(), transition: TransitionType.fadeIn),
        ChildRoute('/youtube-player', child: (_, __) => YoutubePlayerScreen()),
        ChildRoute('/youtube-player-list', child: (_, __) => YoutubePlayerVideoList()),
        ChildRoute('/photo-gallery', child: (_, __) => const SaveImageDemoSQLite()),
        //bottom-pages
        ChildRoute('/references', child: (_, args) => const ReferencesScreen(), transition: TransitionType.fadeIn),
        ModuleRoute('/profile', module: ProfileModule(), transition: TransitionType.fadeIn),
      ],
    ),
  ];
}
