import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/app/modules/home/pages/category_screen.dart';
import 'package:fisio_app/app/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final DocumentSnapshot? data;

  CardInfo(this.data);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(data)));
      },
      child: Card(
        color: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data!['image']),
                        fit: BoxFit.scaleDown),
                    borderRadius: BorderRadius.circular(8)),
                width: 50,
                height: 50,
              ),
            ),
            Text(
              data!['name'],
              style: TextStyles.cardtitle1,
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
