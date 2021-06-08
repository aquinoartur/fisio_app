import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fisio_app/blocs/dialog_login_bloc.dart';
import 'package:fisio_app/blocs/home_screen_bloc.dart';
import 'package:fisio_app/models/ad_state.dart';
import 'package:fisio_app/screens/main/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'main_theme_data.dart';
import 'screens/others/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // incialização do firebase antes de rodar o app
  await Firebase.initializeApp();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => HomeScreenBloc()),
        Bloc((ii) => DialogLoginBloc()),
      ],
      dependencies: [],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
          }
        },
        theme: mainThemeData()
      ),
    );
  }
}

