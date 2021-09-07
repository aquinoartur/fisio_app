import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;
  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/anims/osso.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        // Rive widget.
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtboard = artboard);
      },
    );

    Future.delayed(Duration(seconds: 4)).then((_) {
      Modular.to.navigate('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            width: 125,
            height: 125,
            child: _riveArtboard == null
                ? SizedBox()
                : Rive(artboard: _riveArtboard!),
          )),
        ],
      ),
    );
  }
}
