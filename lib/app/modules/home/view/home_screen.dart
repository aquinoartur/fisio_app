import 'package:fisio_app/app/core/blocs/home_bloc_event.dart';
import 'package:fisio_app/app/core/blocs/home_screen_state.dart';
import 'package:fisio_app/app/modules/home/view/widgets/grid_view_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/extensions/theme_controller_extension.dart';
import '../../../core/blocs/home_screen_bloc.dart';
import '../../../core/core.dart';
import '../../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
  final homeBloc = Modular.get<HomeScreenBloc>();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adState = Provider.of<AdState>(context);
  //   adState.initialization.then(
  //     (status) {
  //       setState(
  //         () {
  //           bannerAd = BannerAd(
  //               adUnitId: adState.bannerAdUnitId,
  //               size: AdSize.banner,
  //               request: const AdRequest(),
  //               listener: adState.adListener)
  //             ..load();
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    homeBloc.add(GetHomeCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeScreenBloc>(
        create: (context) => homeBloc,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            titleT1Widget(
              'Categorias',
              title1.copyWith(color: context.theme.isDark ? FisioColors.white : FisioColors.lowBlack),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  BlocConsumer<HomeScreenBloc, HomeBlocSate>(
                    listener: (context, state) {
                      if (state is EmptyCategoriesState) {
                        showToastAlert('Nenhuma categoria foi encontrada.');
                      }
                      if (state is ErrorHomeCategoriesState) {
                        showToastError('Erro ao buscar categorias.');
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingHomeCategoriesState) {
                        return HomeCustomShimmer(
                          color: context.theme.isDark ? FisioColors.lowBlack : FisioColors.white,
                        );
                      }
                      if (state is LoadedCategoriesState) {
                        return const GridViewWidget();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
