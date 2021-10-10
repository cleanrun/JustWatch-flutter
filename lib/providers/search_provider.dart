//
//  SearchProvider.dart
//  JustWatch
//
//  Created by cleanmac on 29/09/21.
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/utils/configuration.dart';
import '/utils/imdb_url.dart';

import '/models/tv_series.dart';
import '/models/movie.dart';

import '/widgets/universal/popular_collection.dart';

class SearchProvider with ChangeNotifier {
  CollectionType searchType = CollectionType.Movie;

  bool isLoadingData = false;

  List<Movie> _movieResults = [];
  List<TVSeries> _tvResults = [];

  List<Movie> get movieResults {
    return [..._movieResults];
  }

  List<TVSeries> get tvResults {
    return [..._tvResults];
  }

  void setSearchType(CollectionType type) {
    searchType = type;
    notifyListeners();
  }

  Future<void> getMovieResults(String query) async {
    isLoadingData = true;
    notifyListeners();
    final url = Uri.https(Configuration.URL_BASE, SearchURL.getMovies,
        SearchURL.queryParams(query, 1));
    try {
      final List<Movie> resultList = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((movie) {
        resultList.add(Movie.fromJSON(movie));
      });
      _movieResults = resultList;
      isLoadingData = false;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getTvResults(String query) async {
    isLoadingData = true;
    notifyListeners();
    final url = Uri.https(Configuration.URL_BASE, SearchURL.getTvSeries,
        SearchURL.queryParams(query, 1));
    try {
      final List<TVSeries> resultList = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((movie) {
        resultList.add(TVSeries.fromJSON(movie));
      });
      _tvResults = resultList;
      isLoadingData = false;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
