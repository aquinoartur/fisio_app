import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fisio_app/app/blocs/dialog_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loading_indicator_widget.dart';

Widget buttonLoginGoogle(BuildContext context, String text) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Modular.to.pushReplacementNamed('/home');
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/google.jpg"),
          )),
        ),
        Text(
          text,
          style: GoogleFonts.nunito(),
        )
      ],
    ),
  );
}

Widget buttonLogin(BuildContext context, String text) {
  final primaryColor = Theme.of(context).primaryColor;
  final bloc = BlocProvider.getBloc<DialogLoginBloc>();
  return Material(
    color: primaryColor,
    borderRadius: BorderRadius.circular(30),
    child: InkWell(
        onTap: () {
          bloc.isLoad(); //toggle
          Future.delayed(Duration(seconds: 3)).then((_) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Modular.to.pushReplacementNamed('/home');
          });
        },
        borderRadius: BorderRadius.circular(30),
        child: StreamBuilder<bool>(
          initialData: false,
          stream: bloc.output,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Container(
                alignment: Alignment.center,
                height: 55,
                width: 200,
                child: snapshot.data
                    ? LoadingIndicatorWidget(
                        color: Colors.white,
                        size: 20.0,
                        strokeWidth: 3.0,
                      )
                    : Text(
                        text,
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ));
          },
        )),
  );
}

Widget buttonForget(BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Esqueceu a senha?  ",
          style: GoogleFonts.nunito(color: Colors.black87, fontSize: 14),
        )
      ],
    ),
  );
}
