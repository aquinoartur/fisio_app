import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/blocs/home_screen_bloc.dart';
import 'package:fisio_app/models/ad_state.dart';
import 'package:fisio_app/text_styles/text_styles.dart';
import 'package:fisio_app/widgets/card_info_widget.dart';
import 'package:fisio_app/widgets/custom_drawer_widget.dart';
import 'package:fisio_app/widgets/text_title_appBar_widget.dart';
import 'package:fisio_app/widgets/title_t1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final bloc = BlocProvider.getBloc<HomeScreenBloc>();

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
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_open, color: primaryColor, size: 30,),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: textTitleAppBar(primaryColor),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
          actions: [
            IconButton(
                icon: Icon(Icons.star, size: 25,),
                onPressed: () {Navigator.of(context).pushNamed('/references');})
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleT1Widget("Meus favoritos", TextStyles.title1),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    child: ListView.separated(
                      itemCount: 10,
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context,index){return SizedBox(width:10);},
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Container( // todo componentizar
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            //border: Border.all(color: primaryColor, width: 2)
                          ),
                          width: 150,
                          child: Text("Nome do teste", style: TextStyles.cardtitle3,),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            titleT1Widget("Categorias", TextStyles.title1),
            Expanded(
              flex: 2,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  StreamBuilder<List<DocumentSnapshot>>(
                    stream: bloc.outList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                       return GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              childAspectRatio: 1.8
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CardInfo(snapshot.data![index]);
                          },
                        );
                      else
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(primaryColor),
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
            if (bannerAd == null) SizedBox()
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height:50, child: AdWidget( ad: bannerAd!,),),
              )
          ],
        ));
  }
}