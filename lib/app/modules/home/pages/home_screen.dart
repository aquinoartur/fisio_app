import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisio_app/app/ad_mob/ad_state.dart';
import 'package:fisio_app/app/blocs/home_screen_bloc.dart';
import 'package:fisio_app/app/modules/home/home_controller/home_screen_controller.dart';
import 'package:fisio_app/app/design_system/text_styles/text_styles.dart';
import 'package:fisio_app/app/widgets/card_info_widget.dart';
import 'package:fisio_app/app/widgets/custom_shimmer_home.dart';
import 'package:fisio_app/app/widgets/customs_app_bar.dart';
import 'package:fisio_app/app/widgets/header_favorites.dart';
import 'package:fisio_app/app/widgets/title_t1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:fisio_app/app/design_system/snackbars/fisio_snackbars.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  BannerAd? bannerAd;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final bloc = BlocProvider.getBloc<HomeScreenBloc>();

  final _controller = HomeScreenController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then(
      (status) {
        setState(
          () {
            bannerAd = BannerAd(
                adUnitId: adState.bannerAdUnitId,
                size: AdSize.banner,
                request: AdRequest(),
                listener: adState.adListener)
              ..load();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    showToastSucess('Login realizado com sucesso');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(),
      body: _selectedIndex == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleT1Widget("Meus favoritos", TextStyles.title1),
                headerFavorites(primaryColor),
                SizedBox(height: 5),
                //bannerAd == null ? SizedBox(height: 5) : adMob(bannerAd!),
                SizedBox(height: 5),
                titleT1Widget("Categorias", TextStyles.title1),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      StreamBuilder<List<DocumentSnapshot>>(
                        stream: bloc.outList,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return HomeCustomShimmer();
                          else
                            return GridView.builder(
                              gridDelegate: _controller.gridDelegate,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return CardInfo(snapshot.data![index]);
                              },
                            );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            )
          : bloc.toListWidgets().elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: _controller.bottomBoxDecoration,
        margin: EdgeInsets.all(6.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: primaryColor,
              color: Colors.black,
              tabs: _controller.tabs,
              selectedIndex: _selectedIndex,
              onTabChange: (index) => setState(() {
                _selectedIndex = index;
              }),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
