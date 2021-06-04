import 'package:fisio_app/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

Widget animationRive2 (Artboard? artboard){
  return Padding(
    padding: EdgeInsets.only(top: 200),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          child: artboard == null  ? SizedBox() : Rive(artboard: artboard),
        ),
        SizedBox(height: 5,),
        Text("Selecione uma subcategoria", style: TextStyles.t4,)
      ],
    ),
  );
}