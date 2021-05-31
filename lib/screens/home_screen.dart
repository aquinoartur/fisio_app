import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/models/ad_state.dart';
import 'package:fisio_app/widgets/card_info_widget.dart';
import 'package:fisio_app/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

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
    adState.initialization.then(
        (status){
          setState(() {
            bannerAd = BannerAd(
              adUnitId: adState.bannerAdUnitId,
              size: AdSize.banner,
              request: AdRequest(),
              listener: adState.adListener
            )..load();
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        backgroundColor: primaryColor,
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(
            "Categorias",
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Text("0"),
            ),
            IconButton(icon: Icon(Icons.star), onPressed: () {})
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 16, left: 10, bottom: 10, right: 12),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, Marcel.",
                          style: GoogleFonts.nunito(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Selecione uma categoria para visualizar os testes disponíveis.",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("categorias")
                        .snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ));
                        default:
                          List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                          return GridView.builder(
                            padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 12),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 5,
                            ),
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
              Container(
                height: 50,
                child: AdWidget(ad: bannerAd!,),
              )
          ],
        ));
  }
}
