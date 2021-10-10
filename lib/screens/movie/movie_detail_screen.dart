//
//  MovieDetailScreen.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '/utils/configuration.dart';

import '/providers/movie_provider.dart';

import '/widgets/universal/production_company_item.dart';

class MovieDetailScreen extends StatefulWidget {
  static const ROUTE_NAME = '/movie-detail';

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  int? _movieId;
  var _isInit = false;
  var _isLoadingData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _isLoadingData = true;
      final arguments = ModalRoute.of(context)!.settings.arguments;
      _movieId = arguments as int;
      Provider.of<MovieProvider>(context).loadMovie(_movieId!).then((_) {
        _isLoadingData = false;
      });
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          _isLoadingData
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/images/placeholder_movie_backdrop.jpg',
                          image: Configuration.URL_IMG_BASE +
                              (provider.movie?.backdropPath ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      createMovieDetails(provider),
                      createProductionCompaniesList(provider),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
          Positioned(
            top: 30,
            child: MaterialButton(
              color: Colors.white,
              textColor: Colors.black,
              child: Icon(Icons.arrow_back),
              padding: const EdgeInsets.all(10),
              shape: CircleBorder(),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createMovieDetails(MovieProvider provider) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder_movie_backdrop.jpg',
                    image: Configuration.URL_IMG_BASE +
                        (provider.movie?.posterPath ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      provider.movie?.title ?? '',
                      style: TextStyle(
                        fontFamily: 'ArialCE',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              createMovieInfo(
                  'Release Date',
                  DateFormat('dd MMM yyyy').format(
                      DateTime.parse(provider.movie?.releaseDate ?? ''))),
              SizedBox(width: 2),
              createMovieInfo(
                  'Duration', '${provider.movie?.runtime ?? 0} mins'),
              SizedBox(width: 2),
              createMovieInfo(
                  'Rating', '${provider.movie?.voteAverage ?? 0.0} / 10'),
            ],
          ),
          SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  fontFamily: 'ArialCE',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                provider.movie?.overview ?? '',
                style: TextStyle(
                  fontFamily: 'ArialCE',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget createProductionCompaniesList(MovieProvider provider) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Production Companies',
              style: TextStyle(
                fontFamily: 'ArialCE',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 170,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: provider.movie!.productionCompanies.length,
              itemBuilder: (_, index) => ProductionCompanyItem(
                  provider.movie!.productionCompanies[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget createMovieInfo(String title, String details) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'ArialCE',
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          details,
          style: TextStyle(
            fontFamily: 'ArialCE',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
