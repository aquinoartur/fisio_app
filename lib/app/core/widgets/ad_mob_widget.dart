import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Widget adMob(BannerAd bannerAd) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 50,
      child: AdWidget(
        ad: bannerAd,
      ),
    ),
  );
}
