import 'package:url_launcher/url_launcher.dart';

class HomeTestScreenController {
  //*test screen
  Future<void> urlOpen(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Url não encontrado $url';
    }
  }
}
