import 'package:flutter/material.dart';

class FirstLinearGradientWidget extends StatelessWidget {
  const FirstLinearGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(1),
            Colors.white,
          ])),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
    );
  }
}

class SecLinearGradientWidget extends StatelessWidget {
  const SecLinearGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.999),
            primaryColor
          ])),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.93,
    );
  }
}