//
//  HomeTabScreen.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';

import 'movies_home_screen.dart';
import 'search_home_screen.dart';
import 'tvseries_home_screen.dart';

enum HomeTabIndex { Movies, TVSeries, Search }

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  HomeTabIndex index = HomeTabIndex.Movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            createTabScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 24,
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    createTabIcon(context, HomeTabIndex.Movies),
                    createTabIcon(context, HomeTabIndex.TVSeries),
                    createTabIcon(context, HomeTabIndex.Search),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createTabIcon(BuildContext context, HomeTabIndex type) {
    var icon;
    if (type == HomeTabIndex.Movies) {
      icon = Icons.movie;
    } else if (type == HomeTabIndex.TVSeries) {
      icon = Icons.tv;
    } else {
      icon = Icons.search;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          index = type;
        });
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 2),
            if (index == type)
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget createTabScreen() {
    if (index == HomeTabIndex.Movies) {
      return MoviesHomeScreen();
    } else if (index == HomeTabIndex.TVSeries) {
      return TVSeriesHomeScreen();
    } else {
      return SearchHomeScreen();
    }
  }
}
