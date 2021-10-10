//
//  SearchResultItem.dart
//  JustWatch
//
//  Created by cleanmac on 08/10/21.
//

import 'package:flutter/material.dart';

import '/models/movie.dart';
import '/models/tv_series.dart';

import '/widgets/universal/popular_collection.dart';

import '/screens/movie/movie_detail_screen.dart';
import '/screens/tvseries/tv_detail_screen.dart';

import '/utils/configuration.dart';

class SearchResultItem extends StatelessWidget {
  CollectionType type;
  Movie? movie;
  TVSeries? tv;

  SearchResultItem({required this.type, this.movie, this.tv});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (type == CollectionType.Movie) {
          Navigator.of(context)
              .pushNamed(MovieDetailScreen.ROUTE_NAME, arguments: movie!.id);
        } else {
          Navigator.of(context)
              .pushNamed(TVDetailScreen.ROUTE_NAME, arguments: tv!.id);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: createPoster((type == CollectionType.Movie
                        ? movie?.posterPath ?? ''
                        : tv?.posterPath ?? '')),
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type == CollectionType.Movie
                              ? movie!.title
                              : tv!.originalName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'ArialCE',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: 14,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(width: 6),
                            Text(
                              type == CollectionType.Movie
                                  ? '${movie!.voteAverage} / 10'
                                  : '${tv!.voteAverage} / 10',
                              style: TextStyle(
                                fontFamily: 'ArialCE',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: createGenreList(
                              type,
                              type == CollectionType.Movie
                                  ? movie!.genreIds
                                  : tv!.genreIds),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createPoster(String url) {
    if (url.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder_movie_poster.png',
          image: Configuration.URL_IMG_BASE + url,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Image.asset(
          'assets/images/placeholder_movie_poster.png',
          fit: BoxFit.cover,
        ),
      );
    }
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
      padding: EdgeInsets.only(right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
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
}
