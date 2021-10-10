//
//  SearchHomeScreen.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/search_provider.dart';

import '/widgets/search/search_result_item.dart';
import '/widgets/universal/popular_collection.dart';

class SearchHomeScreen extends StatelessWidget {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: 'Search here..'),
                                onChanged: (query) {
                                  _onSearchChanged(provider, query);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  child: createFilterButton(
                    context,
                    "Movie",
                    provider.searchType == CollectionType.Movie,
                  ),
                  onTap: () {
                    provider.setSearchType(CollectionType.Movie);
                  },
                ),
                SizedBox(width: 8),
                GestureDetector(
                  child: createFilterButton(
                    context,
                    "TV Series",
                    provider.searchType == CollectionType.TV,
                  ),
                  onTap: () {
                    provider.setSearchType(CollectionType.TV);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: createList(provider),
          )
        ],
      ),
    );
  }

  Widget createFilterButton(BuildContext context, String title, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColorLight : Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'ArialCE',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: isActive ? Theme.of(context).primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget createNoDataInfo() {
    return Column(
      children: [
        SizedBox(height: 150),
        Icon(
          Icons.help_center,
          size: 50,
          color: Colors.grey,
        ),
        SizedBox(height: 10),
        Text(
          'No data available',
          style: TextStyle(
            fontFamily: 'ArialCE',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget createList(SearchProvider provider) {
    if (provider.isLoadingData) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (provider.searchType == CollectionType.Movie) {
        if (provider.movieResults.isEmpty) {
          return createNoDataInfo();
        } else {
          return createListContent(provider, CollectionType.Movie);
        }
      } else {
        if (provider.movieResults.isEmpty) {
          return createNoDataInfo();
        } else {
          return createListContent(provider, CollectionType.TV);
        }
      }
    }
  }

  Widget createListContent(SearchProvider provider, CollectionType type) {
    return Container(
      child: ListView.builder(
        itemCount: (type == CollectionType.Movie)
            ? provider.movieResults.length
            : provider.tvResults.length,
        itemBuilder: (_, index) => (type == CollectionType.Movie)
            ? SearchResultItem(
                type: CollectionType.Movie,
                movie: provider.movieResults.toList()[index],
              )
            : SearchResultItem(
                type: CollectionType.TV,
                tv: provider.tvResults.toList()[index],
              ),
      ),
    );
  }

  void _onSearchChanged(SearchProvider provider, String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (query.isNotEmpty) {
        (provider.searchType == CollectionType.Movie)
            ? provider.getMovieResults(query)
            : provider.getTvResults(query);
      }
    });
  }
}
