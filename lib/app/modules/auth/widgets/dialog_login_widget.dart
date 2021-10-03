import 'dart:ui';
import 'package:fisio_app/app/blocs/auth_bloc.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_events.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buttons_login_widget.dart';

class DialogLogin extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = Modular.get<AuthBloc>();
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
                    icon: const Icon(Icons.close, size: 18.0),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Text(
                    'Insira seus dados',
                    style: GoogleFonts.nunito(
                      color: primaryColor,
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
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    buttonForget(context),
                    const SizedBox(height: 10),
                    Material(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        child: buttonLogin(context: context, text: 'Entrar'),
                        onTap: () {
                          bloc.add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));

                          if (bloc.state is LoginState) {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    buttonLoginGoogle(context, 'Entrar com o Google')
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
