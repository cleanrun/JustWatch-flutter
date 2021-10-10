//
//  PopularMoviesItem.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';

import '/models/movie.dart';
import '/models/tv_series.dart';

import '/screens/movie/movie_detail_screen.dart';
import '/screens/tvseries/tv_detail_screen.dart';

import 'popular_collection.dart';

import '/utils/configuration.dart';

class PopularItem extends StatelessWidget {
  CollectionType type;
  Movie? movie;
  TVSeries? tv;

  PopularItem({required this.type, this.movie, this.tv});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 300,
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_movie_backdrop.jpg',
              image: Configuration.URL_IMG_BASE +
                  ((type == CollectionType.Movie)
                      ? movie!.backdropPath
                      : tv!.backdropPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        (type == CollectionType.Movie)
            ? routeToMovieDetail(context, movie!.id)
            : routeToTvDetail(context, tv!.id);
      },
    );
  }

  void routeToMovieDetail(BuildContext context, int id) {
    Navigator.of(context)
        .pushNamed(MovieDetailScreen.ROUTE_NAME, arguments: id);
  }

  void routeToTvDetail(BuildContext context, int id) {
    Navigator.of(context).pushNamed(TVDetailScreen.ROUTE_NAME, arguments: id);
  }
}
