import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/app/modules/home/home_controller/home_test_screen_controller.dart';
import 'package:fisio_app/app/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class TestScreen extends StatefulWidget {
  final DocumentSnapshot? data;
  TestScreen(this.data);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<String> list = [];

  final HomeTestScreenController controller = HomeTestScreenController();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.data!["images"].map((url) {
        return list.add(url);
      }).toList();
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
        title: Text(
          "Detalhes do teste",
          style: GoogleFonts.nunito(fontSize: 18, color: primaryColor),
        ),
        iconTheme: IconThemeData(color: primaryColor),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close_rounded, color: primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.home_outlined, color: primaryColor),
          )
        ],
      ),
      body: Column(
        children: [
          list.isNotEmpty
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        widget.data!["images"][index],
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: new SwiperPagination(),
                  ),
                )
              : Container(),
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
                        child: Text(
                          widget.data!["name"],
                          style: TextStyles.ts1,
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
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Descrição:",
                    style: TextStyles.ts2,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.data!["resume"],
                    style: TextStyles.ts3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 55,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        elevation: 0,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text("Obter teste", style: TextStyles.ts4),
                      onPressed: () => setState(
                          () => controller.urlOpen(widget.data!["test"])),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => setState(
                        () => controller.urlOpen(widget.data!["other"])),
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "Mais informações.",
                        style: GoogleFonts.nunito(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
