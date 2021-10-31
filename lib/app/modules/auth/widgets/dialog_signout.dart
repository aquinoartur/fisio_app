import 'dart:ui';
import 'package:fisio_app/app/core/core.dart';
import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buttons_login_widget.dart';

class DialogSignout extends StatelessWidget {
  final themeController = Modular.get<FisioThemeController>();
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: themeController.isDark ? FisioColors.lowBlack : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
                    icon: Icon(
                      Icons.close,
                      size: 18.0,
                      color: themeController.isDark ? Colors.white : FisioColors.lowBlack,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Criar conta',
                    style: GoogleFonts.nunito(
                      color: FisioColors.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
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
                    const SizedBox(height: 10),
                    Material(
                      color: FisioColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        child: buttonLogin(context: context, text: 'Cadastrar'),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    // buttonLoginGoogle(context, 'Cadastrar com o Google')
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
