import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreenController {
  //**bottomNavBar
  var gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    childAspectRatio: 1.8,
  );

  var tabs = [
    const GButton(icon: LineIcons.home, text: 'Home'),
    const GButton(icon: LineIcons.heart, text: 'Favoritos'),
    const GButton(icon: LineIcons.book, text: 'ReferĂȘncias'),
    const GButton(icon: LineIcons.user, text: 'Perfil'),
  ];
}
