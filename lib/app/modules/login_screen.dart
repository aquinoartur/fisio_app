import 'dart:ui';
import 'package:fisio_app/app/text_styles/text_styles.dart';
import 'package:fisio_app/app/widgets/dialog_login_widget.dart';
import 'package:fisio_app/app/widgets/dialog_signout.dart';
import 'package:fisio_app/app/widgets/linear_gradient_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/login.jpg"),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 1.1,
              child: FirstLinearGradientWidget(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              child: SecLinearGradientWidget(),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 1.5,
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
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: isLoaded ? 1 : 0,
                        child: Material(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (_) => DialogLogin(),
                                barrierDismissible: false),
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 300,
                              child: Text(
                                "Login",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            //Positioned.fill(child: ContactsLoginWidget()),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight / 1.15,
                child: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => DialogSignout(),
                    barrierDismissible: false,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    child: Text(
                      "Criar conta",
                      style: TextStyles.cardtitle1.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
