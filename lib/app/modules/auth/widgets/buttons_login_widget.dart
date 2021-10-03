import 'package:fisio_app/app/blocs/auth_bloc.dart';
import 'package:fisio_app/app/modules/auth/bloc/auth_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/loading_indicator_widget.dart';

Widget buttonLoginGoogle(BuildContext context, String text) {
  final bloc = Modular.get<AuthBloc>();
  return GestureDetector(
    onTap: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      bloc.add(GoogleLoginEvent());
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/google.jpg'),
          )),
        ),
        Text(text, style: GoogleFonts.nunito())
      ],
    ),
  );
}

Widget buttonLogin({
  required BuildContext context,
  required String text,
}) {
  return Container(
      alignment: Alignment.center,
      height: 55,
      width: 200,
      color: Colors.transparent,
      child: Text(
        text,
        style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      )

      /*\
         const LoadingIndicatorWidget(
        color: Colors.white,
        size: 20.0,
        strokeWidth: 3.0,
      )
         */
      );
}

Widget buttonForget(BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Esqueceu a senha?  ',
          style: GoogleFonts.nunito(color: Colors.black87, fontSize: 14),
        )
      ],
    ),
  );
}
