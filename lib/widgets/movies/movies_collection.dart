//
//  MoviesCollection.dart
//  JustWatch
//
//  Created by cleanmac on 29/09/21.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/movies_provider.dart';

import '/widgets/movies/movies_item.dart';

enum MoviesCollectionType { NowPlaying, Upcoming }

class MoviesCollection extends StatelessWidget {
  MoviesCollectionType type;
  bool isLoading;

  MoviesCollection({required this.type, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoviesProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type == MoviesCollectionType.Upcoming
                      ? 'Upcoming'
                      : 'Now Playing',
                  style: TextStyle(
                    fontFamily: 'ArialCE',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
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
          Container(
            height: 300,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: type == MoviesCollectionType.Upcoming
                        ? provider.upcoming.length
                        : provider.nowPlaying.length,
                    itemBuilder: (_, index) => MoviesItem(
                        movie: type == MoviesCollectionType.Upcoming
                            ? provider.upcoming.toList()[index]
                            : provider.nowPlaying.toList()[index]),
                  ),
          ),
        ],
      ),
    );
  }
}
