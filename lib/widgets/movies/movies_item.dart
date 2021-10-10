//
//  MoviesItem.dart
//  JustWatch
//
//  Created by cleanmac on 29/09/21.
//

import 'package:flutter/material.dart';

import '/models/movie.dart';

import '/utils/configuration.dart';

import '/screens/movie/movie_detail_screen.dart';

class MoviesItem extends StatelessWidget {
  Movie movie;

  MoviesItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 180,
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
              placeholder: 'assets/images/placeholder_movie_poster.png',
              image: Configuration.URL_IMG_BASE + movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieDetailScreen.ROUTE_NAME, arguments: movie.id);
      },
    );
  }
}
