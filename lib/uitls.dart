import 'package:url_launcher/url_launcher.dart';

void launchURL(url) async {
  try {
    await launch(url);
  } catch (e) {
    // throw 'Could not launch $url';
    // ignore: avoid_print
    print(e);
  }
}
