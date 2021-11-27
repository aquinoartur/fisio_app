import '../../core/extensions/theme_controller_extension.dart';
import '../../core/widgets/customs_app_bar.dart';
import '../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_controller/home_screen_controller.dart';

class FisioRouterOutlet extends StatefulWidget {
  const FisioRouterOutlet({Key? key}) : super(key: key);

  @override
  _FisioRouterOutletState createState() => _FisioRouterOutletState();
}

class _FisioRouterOutletState extends State<FisioRouterOutlet> {
  final _controller = HomeScreenController();

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: RouterOutlet(),
      bottomNavigationBar: AnimatedBuilder(
        animation: context.theme,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
              color: context.theme.isDark ? FisioColors.highBlack : Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black.withOpacity(.2),
                ),
              ],
            ),
            margin: const EdgeInsets.all(6.0),
            child: NavigationListener(
              builder: (_, __) {
                return SafeArea(
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
                      color: context.theme.isDark ? FisioColors.white : FisioColors.highBlack,
                      tabs: _controller.tabs,
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) => changeRoute(index),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void changeRoute(int index) {
    if (index == 0) Modular.to.navigate('/home/home-screen');
    if (index == 1) Modular.to.navigate('/home/favorites/');
    if (index == 2) Modular.to.navigate('/home/references');
    if (index == 3) Modular.to.navigate('/home/profile/');
  }
}
