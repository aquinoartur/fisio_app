import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';

Widget headerFavorites(Color color) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(width: 10),
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
                    'Nome do teste',
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
