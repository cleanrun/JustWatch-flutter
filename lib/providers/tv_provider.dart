//
//  TVProvider.dart
//  JustWatch
//
//  Created by cleanmac on 29/09/21.
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/configuration.dart';
import '../utils/imdb_url.dart';

import '/models/tv_series.dart';

class TVProvider with ChangeNotifier {
  List<TVSeries> _popular = [];
  List<TVSeries> _onTheAir = [];
  List<TVSeries> _topRated = [];

  List<TVSeries> get popular {
    return [..._popular];
  }

  List<TVSeries> get onTheAir {
    return [..._onTheAir];
  }

  List<TVSeries> get topRated {
    return [..._topRated];
  }

  Future<void> getPopular() async {
    final url = Uri.https(Configuration.URL_BASE, TVSeriesURL.getPopular,
        TVSeriesURL.queryParams);
    try {
      final List<TVSeries> pop = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((tv) {
        pop.add(TVSeries.fromJSON(tv));
      });
      _popular = pop;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getOnTheAir() async {
    final url = Uri.https(Configuration.URL_BASE, TVSeriesURL.getOnTheAir,
        TVSeriesURL.queryParams);
    try {
      final List<TVSeries> ota = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((tv) {
        ota.add(TVSeries.fromJSON(tv));
      });
      _onTheAir = ota;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getTopRated() async {
    final url = Uri.https(Configuration.URL_BASE, TVSeriesURL.getTopRated,
        TVSeriesURL.queryParams);
    try {
      final List<TVSeries> tr = [];
      final response = await http.get(url);
      final Iterable results = jsonDecode(response.body)['results'];
      results.forEach((tv) {
        tr.add(TVSeries.fromJSON(tv));
      });
      _topRated = tr;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
