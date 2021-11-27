import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';

Widget cardTestWidget({
  required String name,
  required String description,
  required Color cardColor,
  required Color miniCardColor,
  required Color textColor,
  String? category,
  String? subcategory,
}) {
  return Card(
    shape: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
    elevation: 0,
    color: cardColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: title1.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (category != null)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: miniCardColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    category,
                    style: cardtitle3.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              else
                Container(),
              const SizedBox(width: 8.0),
              if (subcategory != null)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: miniCardColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    subcategory,
                    style: cardtitle3.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              else
                Container(),
              IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.star,
                    size: 22,
                    color: Colors.yellow,
                  ),
                  onPressed: () {})
            ],
          ),
          const Divider(
            height: 5,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: cardtitle2,
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
