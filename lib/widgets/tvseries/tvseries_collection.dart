//
//  TVSeriesCollection.dart
//  JustWatch
//
//  Created by cleanmac on 29/09/21.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/tv_provider.dart';

import '/widgets/tvseries/tvseries_item.dart';

enum TVSeriesCollectionType { OnTheAir, TopRated }

class TVSeriesCollection extends StatelessWidget {
  TVSeriesCollectionType type;
  bool isLoading;

  TVSeriesCollection({required this.type, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TVProvider>(context);
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
                  type == TVSeriesCollectionType.OnTheAir
                      ? 'On The Air'
                      : 'Top Rated',
                  style: TextStyle(
                    fontFamily: 'ArialCE',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColorDark,
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
                    itemCount: type == TVSeriesCollectionType.OnTheAir
                        ? provider.onTheAir.length
                        : provider.topRated.length,
                    itemBuilder: (_, index) => TVSeriesItem(
                        tv: type == TVSeriesCollectionType.OnTheAir
                            ? provider.onTheAir.toList()[index]
                            : provider.topRated.toList()[index]),
                  ),
          ),
        ],
      ),
    );
  }
}
