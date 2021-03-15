import 'package:anime_flutter_app/screen/details_screen/details_screen.dart';
import 'package:anime_flutter_app/screen/play_screen.dart';
import 'package:anime_flutter_app/screen/search_result.dart';
//import 'package:anime_flutter_app/screen/test2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/home.dart';
import 'provider/http_calls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HttpCalls>(create: (context) => HttpCalls())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            Home.routeName: (context) => Home(),
            PlayScreen.routeName: (context) => PlayScreen(),
            DetailsScreen.routeName: (context) => DetailsScreen(),
            SearchResult.routeName: (context) => SearchResult()
          },
          home: Home(),
        ));
  }
}
