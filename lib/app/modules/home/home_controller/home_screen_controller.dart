import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreenController {
  //**bottomNavBar
  var gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 1,
    mainAxisSpacing: 1,
    childAspectRatio: 1.8,
  );

  var bottomBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(100),
    boxShadow: [
      BoxShadow(
        blurRadius: 3,
        color: Colors.black.withOpacity(.2),
      ),
    ],
  );

  var tabs = [
    GButton(icon: LineIcons.home, text: 'Home'),
    GButton(icon: LineIcons.heart, text: 'Favoritos'),
    GButton(icon: LineIcons.book, text: 'Referências'),
    GButton(icon: LineIcons.user, text: 'Perfil'),
  ];
}
