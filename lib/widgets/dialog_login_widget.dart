import 'dart:ui';
import 'package:fisio_app/widgets/buttons_login_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  widthFactor: 7,
                  heightFactor: .8,
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Text(
                    "Entrar",
                    style: GoogleFonts.nunito(
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Senha",
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buttonForget(context),
                    SizedBox(
                      height: 10,
                    ),
                    buttonLogin(context, "Entrar"),
                    SizedBox(
                      height: 10,
                    ),
                    buttonLoginGoogle(context, "Entrar com o Google")
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
