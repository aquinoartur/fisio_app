import 'dart:ui';
import 'package:fisio_app/text_styles/text_styles.dart';
import 'package:fisio_app/widgets/dialog_login_widget.dart';
import 'package:fisio_app/widgets/dialog_signout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/login.jpg"), fit: BoxFit.fitHeight
                  )
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height/1.1,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(1),
                          Colors.white,
                        ]
                    )
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/6,)
          ),
          Positioned(
              top: MediaQuery.of(context).size.height/2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.999),
                      primaryColor
                    ]
                  )
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.93,)
              ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height/1.4,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  "Bem-vindo",
                  style: GoogleFonts.nunito(
                      color: primaryColor,
                      fontSize: 38,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Acesse os melhores conteúdos de testes em Fisioterapia.",
                  style: GoogleFonts.nunito(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                  Material(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        showDialog(context: context, builder: (_) => DialogLogin(), barrierDismissible: false);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 300,
                        child: Text(
                        "Entrar",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (_) => DialogSignout(), barrierDismissible: false);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 30,
                        child: Text(
                            "Criar conta.",
                            style: TextStyles.t2,
                            textAlign: TextAlign.center,
                    ),
                      )),
              ],
              )
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.topRight/1.15,
                child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      child: Text("Contatos",style: GoogleFonts.nunito(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,),
                    ),
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutScreen())
                    );
                  },
                ),
            ),
          )
    ]
      )
    );
  }
}
