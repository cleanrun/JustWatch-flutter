//
//  MovieProvider.dart
//  JustWatch
//
//  Created by cleanmac on 01/10/21.
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/utils/configuration.dart';
import '/utils/imdb_url.dart';

import '/models/movie.dart';

class MovieProvider with ChangeNotifier {
  Movie? _movie;

  Movie? get movie {
    return _movie ?? null;
  }

  Future<void> loadMovie(int id) async {
    final url = Uri.https(Configuration.URL_BASE, MoviesURL.getDetails(id),
        MoviesURL.queryParams);
    try {
      final response = await http.get(url);
      _movie = Movie.fromJSON(jsonDecode(response.body));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void resetData() {
    _movie = null;
    notifyListeners();
  }
}
