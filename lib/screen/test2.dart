import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_appavailability/flutter_appavailability.dart';

class Test2Dart extends StatefulWidget {
  final String videoUrl;
  Test2Dart({@required this.videoUrl});
  @override
  _Test2DartState createState() => _Test2DartState();
}

class _Test2DartState extends State<Test2Dart> {
  // var videoUrl =
  //     'https://cdn12.cloud9xx.com/user1342/5810cc0cfcf3b43bea43a1123c5c7de2/EP.12.360p.mp4?token=oqfuLkgsCw48wJ3N7RIivg&expires=1608507025&id=123836';

  var playStoreUrlFreeVersion =
      'https://play.google.com/store/apps/details?id=com.mxtech.videoplayer.ad&hl=en_IN&gl=US';
  var playStorePaidVersion =
      'https://play.google.com/store/apps/details?id=com.mxtech.videoplayer.pro&hl=en_IN&gl=US';

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool freeIsInstalled =
              await DeviceApps.isAppInstalled('com.mxtech.videoplayer.ad');

          bool paidIsInstalled =
              await DeviceApps.isAppInstalled(' com.mxtech.videoplayer.pro');

          print("freeVersionMXPlayer: " +
              freeIsInstalled.toString() +
              ", " +
              "PaidVersionMXPlayer: " +
              paidIsInstalled.toString());

          freeIsInstalled
              ? _launchURL(widget.videoUrl)
              : _launchURL(playStoreUrlFreeVersion);
        },
        child: Text('Open'),
      ),
    );
  }
}
