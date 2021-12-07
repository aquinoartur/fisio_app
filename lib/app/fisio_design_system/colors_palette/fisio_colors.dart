// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../flavors.dart';

class FisioColors {
  //general
  static Color primaryColor = Flavor.isUser ? Color(0XFF4A148C) : Color(0XFF248490);
  static Color primaryHighColor = Flavor.isUser ? Color(0XFF36076F) : Color(0XFF2B8895);
  static Color primaryLightColor = Flavor.isUser ? Color(0XFF7C45BF) : Color(0XFF3CB4C3);
  static Color red = Colors.red;
  static Color greenLight = Color(0XFF248490);
  static Color green = Color(0XFF06904E);
  static Color white = Colors.white;
  static Color transparent = Colors.transparent;

  //darktheme
  static Color darkGrey = Colors.black87.withOpacity(.7);
  static Color pureBlack = Colors.black;
  static Color lightBlack = const Color(0XFF3F3E3E);
  static Color lowBlack = const Color(0XFF191919);
  static Color highBlack = const Color(0XFF202020);
}
