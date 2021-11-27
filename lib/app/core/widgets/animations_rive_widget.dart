import '../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

Widget animationRiveSecondary({required Artboard? artboard, required Color textColor}) {
  return Padding(
    padding: const EdgeInsets.only(top: 200.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: artboard == null ? const SizedBox() : Rive(artboard: artboard),
        ),
        const SizedBox(height: 6.0),
        Text(
          'Selecione uma subcategoria',
          style: t4.copyWith(color: textColor),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}

Widget animationRiveTertiary({required Artboard? artboard, required Color textColor}) {
  return Padding(
    padding: const EdgeInsets.only(top: 200),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: artboard == null ? const SizedBox() : Rive(artboard: artboard),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Não há testes disponíveis no momento',
          style: t4.copyWith(color: textColor),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
