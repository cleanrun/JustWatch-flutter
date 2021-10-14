//
//  MoviesHomeScreen.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/movies_provider.dart';

import '/widgets/universal/popular_collection.dart';
import '/widgets/universal/genres_collection.dart';
import '/widgets/movies/movies_collection.dart';

class MoviesHomeScreen extends StatefulWidget {
  @override
  _MoviesHomeScreenState createState() => _MoviesHomeScreenState();
}

class _MoviesHomeScreenState extends State<MoviesHomeScreen> {
  var _isInit = true;
  var _isLoadingPopularMovies = false;
  var _isLoadingUpcomingMovies = false;
  var _isLoadingNowPlayingMovies = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isLoadingPopularMovies = true;
      _isLoadingUpcomingMovies = true;
      _isLoadingNowPlayingMovies = true;
      Provider.of<MoviesProvider>(context).getPopular().then((_) {
        _isLoadingPopularMovies = false;
      });
      Provider.of<MoviesProvider>(context).getUpcoming().then((_) {
        _isLoadingUpcomingMovies = false;
      });
      Provider.of<MoviesProvider>(context).getNowPlaying().then((_) {
        _isLoadingNowPlayingMovies = false;
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            PopularCollection(
              isLoading: _isLoadingPopularMovies,
              type: CollectionType.Movie,
            ),
            GenresCollection(
              type: CollectionType.Movie,
            ),
            MoviesCollection(
              isLoading: _isLoadingNowPlayingMovies,
              type: MoviesCollectionType.NowPlaying,
            ),
            MoviesCollection(
              isLoading: _isLoadingUpcomingMovies,
              type: MoviesCollectionType.Upcoming,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 100)
          ],
        ),
      ),
    );
  }
}
