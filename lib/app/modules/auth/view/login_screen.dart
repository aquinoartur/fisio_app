import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fisio_app/app/modules/auth/bloc/auth_bloc.dart';

import '../../../core/core.dart';
import '../../../core/extensions/theme_controller_extension.dart';
import '../../../fisio_design_system/fisio_design_system.dart';
import '../widgets/dialog_login_widget.dart';
import '../widgets/dialog_signout.dart';

class LoginScreen extends StatefulWidget {
  final AuthBloc authBloc;
  const LoginScreen({
    Key? key,
    required this.authBloc,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoaded = false;

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
    return Scaffold(
      backgroundColor: FisioColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 1.1,
              child: const FirstLinearGradientWidget(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              child: const SecLinearGradientWidget(),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 1.5,
              child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bem-vindo',
                        style: GoogleFonts.nunito(
                          color: context.theme.isDark ? FisioColors.lowBlack : FisioColors.primaryColor,
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Acesse os melhores conte??dos de testes em Fisioterapia.',
                        style: GoogleFonts.nunito(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: isLoaded ? 1 : 0,
                        child: Material(
                          color: context.theme.isDark ? FisioColors.lowBlack : FisioColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () => showDialog(
                              context: context,
                              builder: (_) => DialogLogin(authBloc: widget.authBloc),
                              barrierDismissible: false,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 300,
                              child: Text(
                                'Login',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight / 1.15,
                child: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => DialogSignout(authBloc: widget.authBloc),
                    barrierDismissible: false,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.isDark ? FisioColors.lowBlack : FisioColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    child: Text(
                      'Criar conta',
                      style: cardtitle1.copyWith(
                        color: FisioColors.white,
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
