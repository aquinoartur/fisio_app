import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TestScreen extends StatefulWidget {
  final DocumentSnapshot? data;

  TestScreen(this.data);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  List<String> list = [];

  Future<void> _urlOpen (String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.data!["images"].map(
              (url){
            return list.add(url);
          }
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text("Detalhes do teste", style: GoogleFonts.nunito(fontSize: 18, color: primaryColor),),
        iconTheme: IconThemeData(color: primaryColor),
        actions: [IconButton(icon: Icon(Icons.home, color: primaryColor,), onPressed: () {}),],
      ),
      body: Column(
        children: [
          list.isNotEmpty ?
          AspectRatio(
            aspectRatio: 16/9,
            child:  Swiper(
              itemCount:list.length,
              itemBuilder: (BuildContext context,int index){
                return new Image.network(widget.data!["images"][index],fit: BoxFit.fill,);
              },
              pagination: new SwiperPagination(),
            ),
          ) : Container(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(16),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(widget.data!["name"], style: GoogleFonts.nunito(
                            color: primaryColor,
                            fontWeight:FontWeight.w600,
                            fontSize: 24
                          ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.star,
                              size: 24,
                              color: Colors.yellow,
                            ),
                            onPressed: () {
                            })
                      ],
                    ), SizedBox(height: 10),
                    Text(
                      "Descrição:",
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.7),
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ), SizedBox(height: 5),
                    Text(
                      widget.data!["resume"],
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.black.withOpacity(.7),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.fade,
                    ), SizedBox(height: 20),
                    Container(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        shadowColor: Colors.black,
                        elevation: 100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                            )
                        ),
                        child:Text(
                          "Fazer teste",
                          style: GoogleFonts.nunito(
                              color: Colors.white, fontSize: 20),
                        ) ,
                        onPressed:() => setState(() {
                          _urlOpen(widget.data!["test"]);
                        }),
                      ),
                    ), SizedBox(height: 25),
                    GestureDetector(
                      onTap: () => setState(() {
                           _urlOpen(widget.data!["other"]);
                          }),
                      child: Text("Mais informações.",
                        style: GoogleFonts.nunito(
                            color: Colors.black87,
                            fontSize: 15
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ), SizedBox(height: 10),
                  ],
              )
            ),
          )
        ],
      )
    );
  }
}
