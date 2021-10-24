import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';

Widget cardTileCategoryScreen(
    {required int selectedIndex, required int index, required Color color, required String name}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: selectedIndex == index ? color : FisioColors.lightBlack,
    ),
    width: 150,
    child: Text(
      name,
      style: cardtitle2,
    ),
  );
}
