import 'package:flutter_modular/flutter_modular.dart';

import '../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';

class ContactsLoginWidget extends StatelessWidget {
  const ContactsLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight / 1.15,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 100.0,
          height: 32.0,
          child: Text(
            'Contatos',
            style: ts3.copyWith(color: FisioColors.primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () => Modular.to.pushNamed('/about'),
      ),
    );
  }
}
