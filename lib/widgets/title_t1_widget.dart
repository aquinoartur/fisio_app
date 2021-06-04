import 'package:fisio_app/text_Styles/text_styles.dart';
import 'package:flutter/material.dart';

Widget titleT1Widget (String string){
  return Padding(
    padding: EdgeInsets.fromLTRB(13, 30, 10, 15),
    child: Text(
      string,
      textAlign: TextAlign.start,
      style: TextStyles.t1,
    ),
  );
}