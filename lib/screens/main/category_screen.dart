import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/screens/main/test_screen.dart';
import 'package:fisio_app/text_styles/text_styles.dart';
import 'package:fisio_app/widgets/animation_rive_2_widget.dart';
import 'package:fisio_app/widgets/card_test_widget.dart';
import 'package:fisio_app/widgets/card_tile_category_screen.dart';
import 'package:fisio_app/widgets/title_t1_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

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
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/anims/osso3.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtboard = artboard);
      },
    );
  }

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            titleT1Widget("Subcategorias", TextStyles.title1),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    firebase.collection("categorias")
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
                          itemCount: docs.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10);},
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    category = docs[index].id;
                                    _selectedIndex = index;
                                    toogle = true;
                                  });
                                },
                                child: cardTileCategoryScreen(
                                    selectedIndex: _selectedIndex,
                                    index: index,
                                    color: primaryColor,
                                    name: docs[index]["name"]));
                          },
                        ),
                      );
                  }
                },
              ),
            ),
            SizedBox(height: 15),
            toogle ? titleT1Widget("Testes", TextStyles.title1) : Container(),
            toogle ? FutureBuilder<QuerySnapshot>(
                    future: firebase
                        .collection("categorias")
                        .doc(widget.data!.id)
                        .collection("subcategorias")
                        .doc(category)
                        .collection("tests")
                        .get(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Container();
                        default:
                          List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                          return Expanded(
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8);
                              },
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestScreen(docs[index])));},
                                  child: cardTestWidget(
                                      name: docs[index]["name"],
                                      description: docs[index]["description"],
                                      color: primaryColor),
                                );
                              },
                            ),
                          );
                      }
                    },
                  )
                : Align(alignment: Alignment.center, child: animationRive2(_riveArtboard)),
          ],
        ));
  }
}
