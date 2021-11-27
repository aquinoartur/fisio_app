import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/extensions/theme_controller_extension.dart';
import '../../../core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import '../../../fisio_design_system/fisio_design_system.dart';
import 'test_screen.dart';

class CategoryScreen extends StatefulWidget {
  final DocumentSnapshot? data;
  const CategoryScreen(
    this.data,
  );
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedIndex = 999;
  String category = '';
  bool toogle = false;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/anims/osso3.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.data!['name']),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          titleT1Widget(
            'Subcategorias',
            title1.copyWith(
              color: context.theme.isDark ? FisioColors.white : FisioColors.lowBlack,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: firebase.collection('categorias').doc(widget.data!.id).collection('subcategorias').snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const SizedBox(height: 80);
                default:
                  List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                  return docs.isEmpty //* this is the header page
                      ? const SizedBox(height: 80)
                      : Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.separated(
                            itemCount: docs.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (_, __) => const SizedBox(width: 10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => setState(
                                  () {
                                    category = docs[index].id;
                                    _selectedIndex = index;
                                    toogle = true;
                                  },
                                ),
                                child: cardTileCategoryScreen(
                                  selectedIndex: _selectedIndex,
                                  index: index,
                                  color: FisioColors.primaryColor,
                                  name: docs[index]['name'],
                                ),
                              );
                            },
                          ),
                        );
              }
            },
          ),
          const SizedBox(height: 15),
          toogle
              ? titleT1Widget(
                  'Testes',
                  title1.copyWith(
                    color: context.theme.isDark ? FisioColors.white : FisioColors.lowBlack,
                  ),
                )
              : Container(),
          toogle
              ? FutureBuilder<QuerySnapshot>(
                  future: firebase
                      .collection('categorias')
                      .doc(widget.data!.id)
                      .collection('subcategorias')
                      .doc(category)
                      .collection('tests')
                      .get(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return LoadingIndicatorWidget(
                          color: FisioColors.primaryColor,
                          size: 20.0,
                        );
                      default: //* this is the body page
                        List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
                        return docs.isEmpty
                            ? Align(
                                alignment: Alignment.center,
                                child: animationRiveTertiary(
                                  artboard: _riveArtboard,
                                  textColor: context.theme.isDark ? FisioColors.white : FisioColors.lowBlack,
                                ),
                              )
                            : Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  shrinkWrap: true,
                                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) => OpenContainer(
                                    openColor: Colors.transparent,
                                    closedColor: Colors.transparent,
                                    openElevation: 0,
                                    closedElevation: 0,
                                    transitionType: ContainerTransitionType.fade,
                                    transitionDuration: const Duration(milliseconds: 1200),
                                    closedBuilder: (context, VoidCallback callback) => GestureDetector(
                                      onTap: callback,
                                      child: cardTestWidget(
                                        name: docs[index]['name'],
                                        description: docs[index]['description'],
                                        cardColor: FisioColors.primaryColor,
                                        miniCardColor: context.theme.isDark ? FisioColors.lowBlack : FisioColors.white,
                                        textColor: context.theme.isDark ? FisioColors.white : FisioColors.primaryColor,
                                      ),
                                    ),
                                    openBuilder: (context, _) => TestScreen(docs[index]),
                                  ),
                                ),
                              );
                    }
                  },
                )
              : Align(
                  alignment: Alignment.center,
                  child: animationRiveSecondary(
                    artboard: _riveArtboard,
                    textColor: context.theme.isDark ? FisioColors.white : FisioColors.lowBlack,
                  ),
                ),
        ],
      ),
    );
  }
}
