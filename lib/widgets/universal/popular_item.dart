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
          child: Stack(
            children: [
              Positioned.fill(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (type == CollectionType.Movie) ? movie!.title : tv!.name,
                      style: TextStyle(
                        fontFamily: 'ArialCE',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: createGenreList(
                          type,
                          type == CollectionType.Movie
                              ? movie!.genreIds
                              : tv!.genreIds),
                    )
                  ],
                ),
              )
            ],
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

  List<Widget> createGenreList(CollectionType type, List<int> list) {
    return [
      for (var index = 0; index <= 2; index++)
        if (index < list.length)
          createGenreItem(type == CollectionType.Movie
              ? Configuration.getMovieGenreName(list[index])
              : Configuration.getTvGenreName(list[index]))
    ];
  }

  Widget createGenreItem(String title) {
    return Padding(
      padding: EdgeInsets.only(right: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'ArialCE',
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
