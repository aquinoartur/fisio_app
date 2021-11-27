import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/extensions/theme_controller_extension.dart';
import '../../../fisio_design_system/fisio_design_system.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_events.dart';
import 'buttons_login_widget.dart';

class DialogLogin extends StatelessWidget {
  final AuthBloc authBloc;
  DialogLogin({
    Key? key,
    required this.authBloc,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: context.theme.isDark ? FisioColors.lowBlack : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      color: context.theme.isDark ? Colors.white : FisioColors.lowBlack,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  child: Text(
                    'Insira seus dados',
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
                      color: FisioColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        child: buttonLogin(context: context, text: 'Entrar'),
                        onTap: () {
                          //TODO implementar validações
                          authBloc.add(
                            LoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 4),
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
