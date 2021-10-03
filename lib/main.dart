import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'app/blocs/auth_bloc.dart';
import 'app/blocs/home_screen_bloc.dart';
import 'app/ad_mob/ad_state.dart';
import 'main_theme_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:bloc_pattern/bloc_pattern.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  await Firebase.initializeApp();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(
    ModularApp(
      module: AppModule(),
      child: Provider.value(
        value: adState,
        builder: (context, child) => AppWidget(),
      ),
    ),
  );
}

class AppWidget extends StatelessWidget {
  final botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => HomeScreenBloc()),
        Bloc((ii) => AuthBloc()),
      ],
      dependencies: const [],
      child: MaterialApp(
              builder: (context, child) {
                child = asuka.builder(context, child);
                child = botToastBuilder(context, child);
                return child;
              },
              navigatorObservers: [BotToastNavigatorObserver()],
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              theme: mainThemeData())
          .modular(),
    );
  }
}
