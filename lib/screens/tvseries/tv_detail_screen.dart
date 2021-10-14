//
//  TVDetailScreen.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '/utils/configuration.dart';

import '/widgets/universal/production_company_item.dart';

import '/providers/single_tv_provider.dart';

class TVDetailScreen extends StatefulWidget {
  static const ROUTE_NAME = '/tv-detail';

  @override
  _TVDetailScreenState createState() => _TVDetailScreenState();
}

class _TVDetailScreenState extends State<TVDetailScreen> {
  int? _tvId;
  var _isInit = false;
  var _isLoadingData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _isLoadingData = true;
      final arguments = ModalRoute.of(context)!.settings.arguments;
      _tvId = arguments as int;
      Provider.of<SingleTVProvider>(context).loadTv(_tvId!).then((_) {
        _isLoadingData = false;
      });
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SingleTVProvider>(context);
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
                        height: 240,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/images/placeholder_movie_backdrop.jpg',
                          image: Configuration.URL_IMG_BASE +
                              (provider.tv?.backdropPath ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                      createMovieDetails(provider),
                      createSeasonList(provider),
                      SizedBox(height: 20),
                      createProductionCompaniesList(provider, false),
                      SizedBox(height: 20),
                      createProductionCompaniesList(provider, true),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
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

  Widget createMovieDetails(SingleTVProvider provider) {
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
                        (provider.tv?.posterPath ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      provider.tv?.name ?? '',
                      style: TextStyle(
                        fontFamily: 'ArialCE',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColorDark,
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
                  'First Air',
                  DateFormat('dd MMM yyyy')
                      .format(DateTime.parse(provider.tv?.firstAirDate ?? ''))),
              SizedBox(width: 2),
              createMovieInfo(
                  'Episodes', '${provider.tv?.numberOfEpisodes ?? 0}'),
              SizedBox(width: 2),
              createMovieInfo(
                  'Rating', '${provider.tv?.voteAverage ?? 0.0} / 10'),
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
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(height: 10),
              Text(
                provider.tv?.overview ?? '',
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

  Widget createProductionCompaniesList(
      SingleTVProvider provider, bool isNetwork) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              isNetwork ? 'Networks' : 'Production Companies',
              style: TextStyle(
                fontFamily: 'ArialCE',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 170,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: isNetwork
                  ? provider.tv!.networks.length
                  : provider.tv!.productionCompanies.length,
              itemBuilder: (_, index) => ProductionCompanyItem(isNetwork
                  ? provider.tv!.networks[index]
                  : provider.tv!.productionCompanies[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget createSeasonList(SingleTVProvider provider) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seasons',
              style: TextStyle(
                fontFamily: 'ArialCE',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            SizedBox(height: 8),
            for (var season in provider.tv!.seasons)
              Column(
                children: [
                  ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            season.name,
                            style: TextStyle(
                              fontFamily: 'ArialCE',
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        print('season: ${season.name}');
                      }),
                  Divider(),
                ],
              )
          ],
        ),
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
