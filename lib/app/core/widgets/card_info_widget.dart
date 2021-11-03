import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../fisio_design_system/fisio_design_system.dart';
import '../core.dart';
import 'loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardInfo extends StatelessWidget {
  final DocumentSnapshot? data;

  CardInfo(this.data);
  final themeController = Modular.get<FisioThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            FisioColors.primaryColor,
            FisioColors.highPrimaryColor,
          ],
        ),
      ),
      child: InkWell(
        onTap: () => Modular.to.pushNamed('/home/category', arguments: data, forRoot: true),
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: CachedNetworkImage(
                width: 50,
                height: 50,
                fit: BoxFit.scaleDown,
                imageUrl: data!['image'],
                errorWidget: (context, url, error) => const Center(child: Icon(Icons.info)),
                placeholder: (context, url) => const Center(
                  child: LoadingIndicatorWidget(
                    color: Colors.white,
                    size: 10.0,
                    strokeWidth: 1.0,
                  ),
                ),
              ),
            ),
            Text(
              data!['name'],
              style: cardtitle1,
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
