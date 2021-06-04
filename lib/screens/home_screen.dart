import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/models/ad_state.dart';
import 'package:fisio_app/text_Styles/text_styles.dart';
import 'package:fisio_app/widgets/card_info_widget.dart';
import 'package:fisio_app/widgets/custom_drawer_widget.dart';
import 'package:fisio_app/widgets/text_title_appBar_widget.dart';
import 'package:fisio_app/widgets/title_t1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        bannerAd = BannerAd(
            adUnitId: adState.bannerAdUnitId,
            size: AdSize.banner,
            request: AdRequest(),
            listener: adState.adListener)
          ..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: textTitleAppBar(primaryColor),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
          actions: [
            IconButton(icon: Icon(Icons.star), onPressed: () {})
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleT1Widget("Meus Favoritos"),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index){
                  return SizedBox(width: 10,);
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor,
                    ),
                    width: 150,
                    child: Text("Nome do teste", style: TextStyles.t2,),
                  );
                },
                itemCount: 10,
              ),
            ),
            titleT1Widget("Categorias"),
            Expanded(
              flex: 2,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("categorias")
                        .snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),));
                        default:
                          List<DocumentSnapshot> docs =
                              snapshot.data!.docs.toList();
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: 2.5),
                            padding: EdgeInsets.only(
                                top: 0, left: 10, bottom: 10, right: 10),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              return CardInfo(docs[index]);
                            },
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
            if (bannerAd == null)
              SizedBox()
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50, child: AdWidget( ad: bannerAd!,),),
              )
          ],
        ));
  }
}