import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardTestWidget ({required String name, required String description, required Color color}){
  return Card(
    shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)),
    elevation: 0,
    color: color,
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8),
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
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.star,
                    size: 22,
                    color: Colors.yellow,
                  ),
                  onPressed: () {})
            ],
          ),
          Divider( height: 5, color: Colors.white,),
          SizedBox(height: 5,),
          Text(
            description,
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}