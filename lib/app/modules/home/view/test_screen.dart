import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/extensions/theme_controller_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../fisio_design_system/fisio_design_system.dart';
import '../home_controller/home_test_screen_controller.dart';

class TestScreen extends StatefulWidget {
  final DocumentSnapshot? data;
  const TestScreen(this.data);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<String> list = [];

  final HomeTestScreenController controller = HomeTestScreenController();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.data!['images'].map((url) {
        return list.add(url);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detalhes do teste',
          style: GoogleFonts.nunito(
            fontSize: 18,
            color: context.theme.isDark ? FisioColors.white : FisioColors.primaryColor,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close_rounded, color: context.theme.isDark ? FisioColors.white : FisioColors.primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.house_outlined,
              size: 18,
              color: context.theme.isDark ? FisioColors.white : FisioColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          list.isNotEmpty
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        widget.data!['images'][index],
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: const SwiperPagination(),
                  ),
                )
              : Container(),
          Expanded(
            child: Container(
              color: context.theme.isDark ? FisioColors.lowBlack : FisioColors.white,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.data!['name'],
                          style: ts1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.star,
                          size: 24,
                          color: Colors.yellow,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descrição:',
                    style: ts2.copyWith(color: context.theme.isDark ? FisioColors.white : null),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.data!['resume'],
                    style: ts3.copyWith(color: context.theme.isDark ? FisioColors.white : null),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    height: 55,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: FisioColors.primaryColor,
                        elevation: 0,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Obter teste', style: ts4),
                      onPressed: () => setState(() => controller.urlOpen(widget.data!['test'])),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => setState(() => controller.urlOpen(widget.data!['other'])),
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        'Mais informações.',
                        style: GoogleFonts.nunito(
                          color: context.theme.isDark ? FisioColors.white : null,
                          fontSize: 16,
                          fontWeight: context.theme.isDark ? FontWeight.w500 : FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
