import 'package:fisio_app/app/fisio_design_system/fisio_design_system.dart';
import '../../home/home_controller/home_test_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class TestScreenFavorites extends StatefulWidget {
  final String texto;
  final String name;
  final List<String> images;
  const TestScreenFavorites({
    required this.texto,
    required this.name,
    required this.images,
  });

  @override
  _TestScreenFavoritesState createState() => _TestScreenFavoritesState();
}

class _TestScreenFavoritesState extends State<TestScreenFavorites> {
  final HomeTestScreenController controller = HomeTestScreenController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detalhes do teste',
          style: GoogleFonts.nunito(fontSize: 18, color: FisioColors.primaryColor),
        ),
        iconTheme: const IconThemeData(color: FisioColors.primaryColor),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close_rounded, color: FisioColors.primaryColor),
        ),
      ),
      body: Column(
        children: [
          widget.images.isNotEmpty
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                    itemCount: widget.images.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Image.network(widget.images[index], fit: BoxFit.fill),
                    pagination: const SwiperPagination(),
                  ),
                )
              : Container(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.name,
                          style: TextStyles.ts1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descrição:',
                    style: TextStyles.ts2,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.texto,
                    style: TextStyles.ts3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
