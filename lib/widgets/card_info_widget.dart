import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInfo extends StatelessWidget {
  final DocumentSnapshot? data;

  CardInfo(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CategoryScreen(data))
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container (
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(data!['image']),
                      fit: BoxFit.scaleDown
                  )
              ),
              width: 55,
              height: 55,
            ),
            Divider(),
            Text(data!['name'], style: GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14,), maxLines: 3, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
