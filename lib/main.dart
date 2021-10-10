//
//  main.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_tab_screen.dart';
import 'screens/movie/movie_detail_screen.dart';
import 'screens/tvseries/tv_detail_screen.dart';

import 'providers/movies_provider.dart';
import 'providers/tv_provider.dart';
import 'providers/search_provider.dart';
import 'providers/movie_provider.dart';
import 'providers/single_tv_provider.dart';

import 'utils/hexcolor.dart';

void main() {
  runApp(JWApp());
}

class JWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider()),
        ChangeNotifierProvider(create: (_) => TVProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => SingleTVProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        title: 'Just Watch',
        theme: ThemeData(
          primaryColor: HexColor('#33539E'),
          primaryColorLight: HexColor('#7FACD6'),
          primaryColorDark: HexColor('#A5678E'),
          accentColor: HexColor('#ECECF6'),
          fontFamily: 'ArialCE',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => HomeTabScreen(),
          MovieDetailScreen.ROUTE_NAME: (_) => MovieDetailScreen(),
          TVDetailScreen.ROUTE_NAME: (_) => TVDetailScreen(),
        },
      ),
    );
  }
}
