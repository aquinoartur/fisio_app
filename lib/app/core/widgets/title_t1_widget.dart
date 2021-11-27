import 'package:flutter/material.dart';

Widget titleT1Widget(String label, TextStyle style) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Text(
      label,
      textAlign: TextAlign.start,
      style: style,
    ),
  );
}
