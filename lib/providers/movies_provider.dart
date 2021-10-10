//
//  MoviesProvider.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/configuration.dart';
import '../utils/imdb_url.dart';

import '../models/movie.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> _popular = [];
  List<Movie> _nowPlaying = [];
  List<Movie> _upcoming = [];

  List<Movie> get popular {
    return [..._popular];
  }

  List<Movie> get nowPlaying {
    return [..._nowPlaying];
  }

  List<Movie> get upcoming {
    return [..._upcoming];
  }

  Future<void> getPopular() async {
    final url = Uri.https(
        Configuration.URL_BASE, MoviesURL.getPopular, MoviesURL.queryParams);
    try {
      final List<Movie> popular = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((movie) {
        popular.add(Movie.fromJSON(movie));
      });
      _popular = popular;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getUpcoming() async {
    final url = Uri.https(
        Configuration.URL_BASE, MoviesURL.getUpcoming, MoviesURL.queryParams);
    try {
      final List<Movie> upcoming = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((movie) {
        upcoming.add(Movie.fromJSON(movie));
      });
      _upcoming = upcoming;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getNowPlaying() async {
    final url = Uri.https(
        Configuration.URL_BASE, MoviesURL.getNowPlaying, MoviesURL.queryParams);
    try {
      final List<Movie> nowPlaying = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((movie) {
        nowPlaying.add(Movie.fromJSON(movie));
      });
      _nowPlaying = nowPlaying;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
