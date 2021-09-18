import 'package:fisio_app/app/design_system/snackbars/fisio_snackbars.dart';
import 'package:fisio_app/app/design_system/text_styles/text_styles.dart';
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
            separatorBuilder: (_, __) => SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showToastSucess('em breve');
                },
                child: Container(
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
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
