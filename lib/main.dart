import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/core/core.dart';
import 'app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart' as provider;
import 'app/core/ad_mob/ad_state.dart';
import 'app/core/blocs/home_screen_bloc.dart';
import 'app/modules/auth/bloc/auth_bloc.dart';
import 'main_theme_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:bloc_pattern/bloc_pattern.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(
    ModularApp(
      module: AppModule(),
      child: provider.Provider.value(
        value: adState,
        builder: (context, child) => AppWidget(),
      ),
    ),
  );
}

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final botToastBuilder = BotToastInit();

  final themeController = Modular.get<FisioThemeController>();

  @override
  void initState() {
    super.initState();
    themeController.loadThemeMode().then((_) => setState);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => HomeScreenBloc()), Bloc((ii) => AuthBloc())],
      dependencies: const [],
      child: AnimatedBuilder(
        animation: themeController,
        builder: (context, _) {
          return MaterialApp(
            builder: (context, child) {
              child = asuka.builder(context, child);
              child = botToastBuilder(context, child);
              return child;
            },
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            theme: themeController.isDark ? darkMode() : lightMode(),
          ).modular();
        },
      ),
    );
  }
}
