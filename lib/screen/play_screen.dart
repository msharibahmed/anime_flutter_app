// import 'package:anime_flutter_app/provider/http_calls.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

// class PlayScreen extends StatefulWidget {
//   static const routeName = 'play-screen';

//   @override
//   _PlayScreenState createState() => _PlayScreenState();
// }

// class _PlayScreenState extends State<PlayScreen> {
//   VideoPlayerController _videoController;
//   void initPlayer() {
//     _videoController = VideoPlayerController.network(
//           // 'https://imdb-video.media-imdb.com/vi2525675801/1434659607842-pgv4ql-1602264472725.mp4?Expires=1608157334&Signature=tTVuDGkll2zEJhvA5Wa8y8UsNTMfCFSjOJ2HM2W-Q959DbBmanAhY-0gHNYeOePJokecVGaOlsDFyHEMlBN01D774LvA5oZ-jtYONBUHU0V2JIRJD0iraFjgMSVw3B4QOxV7hHrU8YywVCYrBdksFoWv2fze1ecgjPRPIzlcMO1aVZh2fPmU3gasH44utMrvtYSLijz4SCNtFu7tBkuQIbvnNRMVQtLN-FzzBkcezvlHpx2YBtyUZfChAWdrSz3ZTKDpdbd7SfN4IGcJY06TkhyGr3ds02cR52IHT8U97qWsMNuTf~gld~ytXriSUdrsBjcztkRjb4FaHmeRnbXSQQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA');
//           'https://cdn14x.cloud9xx.com/user1342/70078f22d615794817446dd6388b22a4/EP.10.360p.mp4?token=1nkF-akL6SIhHJvYFxRzYw&expires=1608143500&id=149113'
//         );
//     // 'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
//     _videoController.initialize().then((value) {
//       setState(() {});
//     });
//   }

//   @override
//   void initState() {
//     initPlayer();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final prov = Provider.of<HttpCalls>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stream Now'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {

//           _videoController.value.isPlaying
//               ? _videoController.pause()
//               : _videoController.play();
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AspectRatio(
//             aspectRatio: _videoController.value.aspectRatio,
//             child: VideoPlayer(_videoController),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = 'play-screen';
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
   final _key = UniqueKey();
  var _loading = true;

  void _pageFinished(String _) {
    setState(() {
      _loading = !_loading;
    });
  }

  final _webViewController = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final url = ModalRoute.of(context).settings.arguments as String;
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0.1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TRIVEOUS ',
                  style: GoogleFonts.bungeeShade(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800)),
              Text('NEWS',
                  style: GoogleFonts.bungeeShade(
                      color: Colors.black, fontSize: 16))
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: mediaQuery.height,
              width: mediaQuery.width,
              child: WebView(
                onPageFinished: _pageFinished,
                key: _key,
                initialUrl: 'https://gogoanime.so/one-punch-man-2nd-season-episode-1',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (webViewController) {
                  _webViewController.complete(webViewController);
                },
              ),
            ),
            _loading
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                        Text('Page Loading...',
                            style: const TextStyle(color: Colors.black))
                      ]))
                : Stack()
          ],
        ));
  }
}
