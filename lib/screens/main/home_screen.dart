import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/blocs/home_screen_bloc.dart';
import 'package:fisio_app/models/ad_state.dart';
import 'package:fisio_app/screens/drawer/favorites_screen.dart';
import 'package:fisio_app/screens/drawer/my_data_screen.dart';
import 'package:fisio_app/screens/drawer/references_screen.dart';
import 'package:fisio_app/text_styles/text_styles.dart';
import 'package:fisio_app/widgets/ad_mob_widget.dart';
import 'package:fisio_app/widgets/card_info_widget.dart';
import 'package:fisio_app/widgets/header_favorites.dart';
import 'package:fisio_app/widgets/text_title_appBar_widget.dart';
import 'package:fisio_app/widgets/title_t1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> _widgetOptions = <Widget>[
    Container(),
    FavoritesScreen(),
    ReferencesScreen(),
    MyDataScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: textTitleAppBar(primaryColor),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: _selectedIndex == 0 ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleT1Widget("Meus favoritos", TextStyles.title1),
          headerFavorites(primaryColor),
          SizedBox(height: 5),
          bannerAd == null ? SizedBox() : adMob(bannerAd!),
          SizedBox(height: 5),
          titleT1Widget("Categorias", TextStyles.title1),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: firebase.collection("categorias").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(primaryColor),
                            ));
                      default:
                        List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 1,
                              childAspectRatio: 2),
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
          SizedBox(height: 20),
        ],
      ) : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container( //bottom nav bar
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.2))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: primaryColor,
              color: Colors.black,
              tabs: [
                GButton(icon: LineIcons.home, text: 'Home'),
                GButton(icon: LineIcons.heart, text: 'Favoritos'),
                GButton(icon: LineIcons.book, text: 'Referências'),
                GButton(icon: LineIcons.user, text: 'Meus dados'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      )
    );
  }
}

