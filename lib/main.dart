import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart' as provider;

import 'app/app_module.dart';
import 'app/core/ad_mob/ad_state.dart';
import 'app/flavors.dart';
import 'app_widget.dart';

Future<void> main() async {
  Flavor.flavorType = FlavorTypes.user;
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
