import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class Utils {
  static Future<String> buildDynamicLink() async {
    String url = 'https://adelmoaquino.page.link';
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/home/teste'),
      androidParameters: AndroidParameters(
        packageName: 'br.com.adelmoaquino.fisio_app',
        minimumVersion: 0,
      ),
      // iosParameters: IosParameters(
      //   bundleId: 'com.example.dynamicLinkDemo',
      //   minimumVersion: '0',
      // ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: 'Acesse o app pelo link e ganhe descontos exclusivos',
        imageUrl: Uri.parse('https://flutter.dev/images/flutter-logo-sharing.png'),
        title: 'Fiosio App Testes',
      ),
    );
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    return dynamicUrl.shortUrl.toString();
  }
}
