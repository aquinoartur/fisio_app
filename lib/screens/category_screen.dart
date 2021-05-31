import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/screens/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot? data;

  CategoryScreen(this.data);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text(
            data!["name"],
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("categorias")
                .doc(data!.id)
                .collection("tests")
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  ));
                default:
                  List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TestScreen(docs[index])));
                          },
                          child: Card(
                            shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 5,
                            color: Colors.white,
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
                                          docs[index]["name"],
                                          style: GoogleFonts.nunito(
                                              color: Colors.black87,
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
                                            color: primaryColor,
                                          ),
                                          onPressed: () {})
                                    ],
                                  ),
                                  Divider( height: 5,),
                                  Text(
                                    docs[index]["description"],
                                    style: GoogleFonts.nunito(
                                        color: primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
              }
            },
          ),
        ));
  }
}
