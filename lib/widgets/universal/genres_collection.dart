//
//  GenresMoviesCollection.dart
//  JustWatch
//
//  Created by cleanmac on 28/09/21.
//

import 'package:flutter/material.dart';

import 'popular_collection.dart';

import '/utils/configuration.dart';

class GenresCollection extends StatelessWidget {
  CollectionType type;

  GenresCollection({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Genres',
                  style: TextStyle(
                    fontFamily: 'ArialCE',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: (type == CollectionType.Movie)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
                  ),
                ),
                OutlinedButton(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontFamily: 'ArialCE',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("See All");
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 1; i <= 4; i++)
                  type == CollectionType.Movie
                      ? createGenreItem(
                          context,
                          Configuration.getMovieGenreName(
                              Configuration.MOVIE_GENRE_ALL[i]))
                      : createGenreItem(
                          context,
                          Configuration.getTvGenreName(
                              Configuration.TV_GENRE_ALL[i]))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createGenreItem(BuildContext context, String title) {
    return Expanded(
      child: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (type == CollectionType.Movie)
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.question_answer_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'ArialCE',
                    //fontWeight: FontWeight.w700,
                    color: (type == CollectionType.Movie)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
