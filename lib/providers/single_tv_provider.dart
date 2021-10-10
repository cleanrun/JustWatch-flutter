//
//  SingleTVProvider.dart
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

class SingleTVProvider with ChangeNotifier {
  TVSeries? _tv;

  TVSeries? get tv {
    return _tv ?? null;
  }

  Future<void> loadTv(int id) async {
    final url = Uri.https(Configuration.URL_BASE, TVSeriesURL.getDetails(id),
        TVSeriesURL.queryParams);
    try {
      final response = await http.get(url);
      _tv = TVSeries.fromJSON(jsonDecode(response.body));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
