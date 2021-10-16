import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/ad_mob/ad_state.dart';
import '../../../core/blocs/home_screen_bloc.dart';
import '../../../core/core.dart';
import '../home_controller/home_screen_controller.dart';
import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  BannerAd? bannerAd;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final bloc = BlocProvider.getBloc<HomeScreenBloc>();
  final themeController = Modular.get<FisioThemeController>();
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
                request: const AdRequest(),
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

    return Scaffold(
      appBar: DefaultAppBar(),
      body: _selectedIndex == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleT1Widget(
                  'Meus favoritos',
                  TextStyles.title1.copyWith(
                    color: themeController.isDark ? FisioColors.white : FisioColors.lowBlack,
                  ),
                ),
                headerFavorites(
                  cardColor: themeController.isDark ? FisioColors.highBlack : FisioColors.white,
                  textColor: themeController.isDark ? FisioColors.white : FisioColors.lowBlack,
                ),
                const SizedBox(height: 5),
                //bannerAd == null ? const SizedBox(height: 5) : adMob(bannerAd!),
                const SizedBox(height: 5),
                titleT1Widget(
                  'Categorias',
                  TextStyles.title1.copyWith(
                    color: themeController.isDark ? FisioColors.white : FisioColors.lowBlack,
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      StreamBuilder<List<DocumentSnapshot>>(
                        stream: bloc.outList,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return HomeCustomShimmer(
                              color: themeController.isDark ? FisioColors.lowBlack : FisioColors.white,
                            );
                          } else {
                            return GridView.builder(
                              gridDelegate: _controller.gridDelegate,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return CardInfo(snapshot.data![index]);
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            )
          : bloc.toListWidgets().elementAt(_selectedIndex),
      bottomNavigationBar: AnimatedBuilder(
          animation: themeController,
          builder: (context, _) {
            return Container(
              decoration: BoxDecoration(
                color: themeController.isDark ? FisioColors.highBlack : FisioColors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.black.withOpacity(.2),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(6.0),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: FisioColors.white,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: FisioColors.primaryColor,
                    color: themeController.isDark ? FisioColors.white : FisioColors.highBlack,
                    tabs: _controller.tabs,
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) => setState(() {
                      _selectedIndex = index;
                    }),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
