import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/screens/category_screen.dart';
import 'package:fisio_app/text_Styles/text_styles.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final DocumentSnapshot? data;

  CardInfo(this.data);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryScreen(data)));
      },
      child: Card(
        color: primaryColor,
        shadowColor: Colors.black87,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,0,8),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data!['image']),
                        fit: BoxFit.scaleDown),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              child: Text(
                data!['name'],
                style: TextStyles.t2,
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
