//
//  PopularMoviesCollection.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:JustWatch/providers/tv_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/movies_provider.dart';

import 'popular_item.dart';

enum CollectionType { Movie, TV }

class PopularCollection extends StatelessWidget {
  bool isLoading;
  CollectionType type;

  PopularCollection({required this.isLoading, required this.type});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context,
        listen: (type == CollectionType.Movie));
    final tvProvider = Provider.of<TVProvider>(context,
        listen: !(type == CollectionType.Movie));
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: (type == CollectionType.Movie)
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontFamily: 'ArialCE',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: (type == CollectionType.Movie)
                              ? movieProvider.popular.length
                              : tvProvider.popular.length,
                          itemBuilder: (_, index) => (type ==
                                  CollectionType.Movie)
                              ? PopularItem(
                                  type: CollectionType.Movie,
                                  movie: movieProvider.popular.toList()[index])
                              : PopularItem(
                                  type: CollectionType.TV,
                                  tv: tvProvider.popular.toList()[index],
                                ),
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
