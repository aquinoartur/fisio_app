import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fisio_app/blocs/home_screen_bloc.dart';
import 'package:fisio_app/models/ad_state.dart';
import 'package:fisio_app/screens/drawer/about_app_screen.dart';
import 'package:fisio_app/screens/drawer/favorites_screen.dart';
import 'package:fisio_app/screens/drawer/my_data_screen.dart';
import 'package:fisio_app/screens/drawer/references_screen.dart';
import 'package:fisio_app/screens/main/home_screen.dart';
import 'package:fisio_app/screens/main/login_screen.dart';
import 'package:flutter/material.dart';
import 'screens/others/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

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
      ],
      dependencies: [],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/my_data':
              return MaterialPageRoute(builder: (_) => MyDataScreen());
            case '/favorites':
              return MaterialPageRoute(builder: (_) => FavoritesScreen());
            case '/about_app':
              return MaterialPageRoute(builder: (_) => AboutAppScreen());
            case '/references':
              return MaterialPageRoute(builder: (_) => ReferencesScreen());
          }
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    systemNavigationBarIconBrightness: Brightness.light
          )
          ),
          primaryColor: Color.fromARGB(255, 74,20,140),
          backgroundColor:  Color.fromARGB(255, 74,20,140),
          accentColor:  Color.fromARGB(255, 74,20,140).withAlpha(28),
          scaffoldBackgroundColor:  Colors.white,
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Color.fromARGB(255, 74,20,140),
              selectionColor: Color.fromARGB(255, 74,20,140),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.nunito(),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                color: Color.fromARGB(255, 74,20,140),
            )
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 74,20,140),
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 74,20,140),
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.grey,
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
          )
        ),
      ),
    );
  }
}

