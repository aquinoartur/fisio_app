import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/screens/test_screen.dart';
import 'package:fisio_app/text_styles/text_styles.dart';
import 'package:fisio_app/widgets/title_t1_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  final DocumentSnapshot? data;

  CategoryScreen(this.data);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedIndex = 999;
  String category = "";
  bool toogle = false;

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.data!["name"],
            style: GoogleFonts.nunito(color: primaryColor, fontSize: 18),
          ),
          iconTheme: IconThemeData(color: primaryColor),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            titleT1Widget("Subcategorias"),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("categorias")
                    .doc(widget.data!.id)
                    .collection("subcategorias")
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container();
                    default:
                      List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                      return Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index){
                            return SizedBox(width: 10,);
                          },
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  category = docs[index].id;
                                  _selectedIndex = index;
                                  toogle = true;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _selectedIndex == index ? primaryColor.withOpacity(.8) : primaryColor,
                                ),
                                width: 150,
                                child: Text(docs[index]["name"], style: TextStyles.t2,),
                              ),
                            );
                          },
                          itemCount: docs.length,
                        ),
                      );
                  }
                },
                ),
              ),
              toogle ? titleT1Widget("Testes") : Container(),
              Container(
               child: FutureBuilder<QuerySnapshot>(
                future: category != "" ? FirebaseFirestore.instance
                    .collection("categorias")
                    .doc(widget.data!.id)
                    .collection("subcategorias").doc(category).collection("tests")
                    .get() : FirebaseFirestore.instance
                    .collection("categorias")
                    .doc(widget.data!.id)
                    .collection("subcategorias").doc().collection("tests")
                    .get() ,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container();
                    default:
                      List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {return SizedBox(height: 8,);},
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TestScreen(docs[index])));
                            },
                            child: Card(
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              color: primaryColor,
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
                                      docs[index]["description"],
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
                            ),
                          );
                        },
                      );
                  }
                },
            ),
             ),
          ],
        ));
  }
}
