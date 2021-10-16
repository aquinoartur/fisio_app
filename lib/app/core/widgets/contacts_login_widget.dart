import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';

import '../../modules/others/about_the_app/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactsLoginWidget extends StatelessWidget {
  const ContactsLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight / 1.15,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 30,
          child: Text(
            'Contatos',
            style: GoogleFonts.nunito(color: FisioColors.primaryColor, fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
        },
      ),
    );
  }
}
