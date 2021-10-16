import 'package:flutter/material.dart';

Widget titleT1Widget(String string, TextStyle textStyle) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Text(
      string,
      textAlign: TextAlign.start,
      style: textStyle,
    ),
  );
}
