//
//  TVSeriesHomeScreen.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/tv_provider.dart';

import '/widgets/universal/popular_collection.dart';
import '/widgets/universal/genres_collection.dart';
import '/widgets/tvseries/tvseries_collection.dart';

class TVSeriesHomeScreen extends StatefulWidget {
  @override
  _TVSeriesHomeScreenState createState() => _TVSeriesHomeScreenState();
}

class _TVSeriesHomeScreenState extends State<TVSeriesHomeScreen> {
  var _isInit = true;
  var _isLoadingPopular = false;
  var _isLoadingOnTheAir = false;
  var _isLoadingTopRated = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isLoadingPopular = true;
      _isLoadingOnTheAir = true;
      _isLoadingTopRated = true;
      Provider.of<TVProvider>(context).getPopular().then((_) {
        _isLoadingPopular = false;
      });
      Provider.of<TVProvider>(context).getOnTheAir().then((_) {
        _isLoadingOnTheAir = false;
      });
      Provider.of<TVProvider>(context).getTopRated().then((_) {
        _isLoadingTopRated = false;
      });

      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            PopularCollection(
              isLoading: _isLoadingPopular,
              type: CollectionType.TV,
            ),
            GenresCollection(
              type: CollectionType.TV,
            ),
            TVSeriesCollection(
              type: TVSeriesCollectionType.OnTheAir,
              isLoading: _isLoadingOnTheAir,
            ),
            TVSeriesCollection(
              type: TVSeriesCollectionType.TopRated,
              isLoading: _isLoadingTopRated,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 100)
          ],
        ),
      ),
    );
  }
}
