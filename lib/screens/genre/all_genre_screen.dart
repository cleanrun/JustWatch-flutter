//
//  AllGenreScreen.dart
//  JustWatch
//
//  Created by cleanmac on 14/10/21.
//

import 'package:flutter/material.dart';

import '/widgets/universal/popular_collection.dart';

import '/utils/configuration.dart';

class AllGenreScreen extends StatelessWidget {
  static const ROUTE_NAME = '/all-genre';

  late CollectionType type;

  @override
  Widget build(BuildContext context) {
    type = ModalRoute.of(context)!.settings.arguments as CollectionType;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: (type == CollectionType.Movie)
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorDark,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).padding.top + 10, 24, 24),
              child: Row(
                children: [
                  MaterialButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    child: Icon(Icons.arrow_back),
                    padding: const EdgeInsets.all(10),
                    shape: CircleBorder(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Flexible(
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
                                  //_onSearchChanged(provider, query);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: createListContent(context),
          )
        ],
      ),
    );
  }

  Widget createListContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: (type == CollectionType.Movie)
              ? Configuration.MOVIE_GENRE_ALL.length
              : Configuration.TV_GENRE_ALL.length,
          itemBuilder: (_, index) => createListItem(
              (type == CollectionType.Movie)
                  ? Configuration.MOVIE_GENRE_ALL[index]
                  : Configuration.TV_GENRE_ALL[index]),
        ),
      ),
    );
  }

  Widget createListItem(int id) {
    return Column(
      children: [
        ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (type == CollectionType.Movie)
                    ? Configuration.getMovieGenreName(id)
                    : Configuration.getTvGenreName(id),
                style: TextStyle(
                  fontFamily: 'ArialCE',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }
}
