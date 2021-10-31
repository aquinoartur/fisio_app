import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/ad_mob/ad_state.dart';
import '../../../core/blocs/home_screen_bloc.dart';
import '../../../core/core.dart';
import '../home_controller/home_screen_controller.dart';
import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
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
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          titleT1Widget(
            'Categorias',
            title1.copyWith(color: themeController.isDark ? FisioColors.white : FisioColors.lowBlack),
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
                        padding: const EdgeInsets.all(10),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
