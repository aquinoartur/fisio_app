import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buttons_login_widget.dart';

class DialogSignout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  widthFactor: 7,
                  heightFactor: .8,
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 18.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Text(
                    'Criar conta',
                    style: GoogleFonts.nunito(
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Repetir senha',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buttonLogin(context, 'Cadastar'),
                    const SizedBox(
                      height: 10,
                    ),
                    buttonLoginGoogle(context, 'Cadastrar com o Google')
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
