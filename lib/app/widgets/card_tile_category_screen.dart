import '../design_system/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

Widget cardTileCategoryScreen(
    {required int selectedIndex,
    required int index,
    required Color color,
    required String name}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: selectedIndex == index ? color.withOpacity(.7) : color,
    ),
    width: 150,
    child: Text(
      name,
      style: TextStyles.cardtitle2,
    ),
  );
}
