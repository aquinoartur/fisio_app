import 'package:fisio_app/app/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

Widget headerFavorites(Color color) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          child: ListView.separated(
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                // todo componentizar
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  //border: Border.all(color: primaryColor, width: 2)
                ),
                width: 150,
                child: Text(
                  "Nome do teste",
                  style: TextStyles.cardtitle3,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
