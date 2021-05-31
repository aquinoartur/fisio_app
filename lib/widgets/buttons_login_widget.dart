import 'package:fisio_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget buttonLoginGoogle (BuildContext context, String text){
    return GestureDetector(
      onTap: (){

      Navigator.of(context).popUntil((route) => route.isFirst);
      
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
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
              )
            ),
    ),
          Text(text, style: GoogleFonts.nunito(),)
        ],
      ),
    );
}

Widget buttonLogin (BuildContext context, String text){
  final primaryColor = Theme.of(context).primaryColor;
  return Material(
    color: primaryColor,
    borderRadius:  BorderRadius.circular(30),
    child: InkWell(
      onTap: (){

        Navigator.of(context).popUntil((route) => route.isFirst);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())
        );
      },
      borderRadius:  BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: 200,
        child: Text(text, style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,)
      ),
    ),
  );
}

Widget buttonForget (BuildContext context){
  return GestureDetector(
    onTap: (){},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Esqueceu a senha?  ",
          style: GoogleFonts.nunito(
              color: Colors.black87,
              fontSize: 14
          ),
        )
      ],
    ),
  );
}