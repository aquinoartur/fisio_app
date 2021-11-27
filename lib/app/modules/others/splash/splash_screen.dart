import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

import '../../../fisio_design_system/fisio_design_system.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_events.dart';

class SplashScreen extends StatefulWidget {
  final AuthBloc authBloc;
  const SplashScreen({
    Key? key,
    required this.authBloc,
  }) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;
  final bloc = Modular.get<AuthBloc>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then(
      (_) {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
            if (user == null) {
              Modular.to.navigate('/login');
            } else {
              bloc.add(PersistentLoginEvent(user: user));
              Modular.to.navigate('/home/home-screen');
              showToastSucess('Login realizado com sucesso');
            }
          },
        );
      },
    );

    rootBundle.load('assets/anims/osso.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 125,
              height: 125,
              child: _riveArtboard == null ? const SizedBox() : Rive(artboard: _riveArtboard!),
            ),
          ),
        ],
      ),
    );
  }
}
