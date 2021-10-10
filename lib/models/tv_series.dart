//
//  TVSeries.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'production_company.dart';
import 'season.dart';

class TVSeries {
  late int id;
  late String name;
  late bool inProduction;
  late String originalName;
  late String originalLanguage;
  late String firstAirDate;
  late String overview;
  late String status;
  late String tagline;
  late String type;
  late double popularity;
  late double voteAverage;
  late int voteCount;
  late int numberOfSeasons;
  late int numberOfEpisodes;
  late String posterPath;
  late String backdropPath;
  List<int> genreIds = [];
  List<ProductionCompany> networks = [];
  List<ProductionCompany> productionCompanies = [];
  List<Season> seasons = [];
  List<String> createdBy = [];

  TVSeries(
      {required this.id,
      required this.name,
      required this.inProduction,
      required this.originalName,
      required this.originalLanguage,
      required this.firstAirDate,
      required this.overview,
      required this.status,
      required this.tagline,
      required this.type,
      required this.popularity,
      required this.voteAverage,
      required this.voteCount,
      required this.numberOfSeasons,
      required this.numberOfEpisodes,
      required this.posterPath,
      required this.backdropPath,
      required this.networks,
      required this.productionCompanies,
      required this.seasons,
      required this.createdBy});

  TVSeries.fromJSON(dynamic data) {
    this.id = data['id'];
    this.name = (data['name'] != null) ? data['name'].toString() : '';
    this.inProduction =
        (data['in_production'] != null) ? data['in_production'] : false;
    this.originalName =
        (data['original_name'] != null) ? data['original_name'].toString() : '';
    this.originalLanguage = (data['original_language'] != null)
        ? data['original_language'].toString()
        : '';
    this.firstAirDate = (data['first_air_date'] != null)
        ? data['first_air_date'].toString()
        : '';
    this.overview =
        (data['overview'] != null) ? data['overview'].toString() : '';
    this.status = (data['status'] != null) ? data['status'].toString() : '';
    this.tagline = (data['tagline'] != null) ? data['tagline'].toString() : '';
    this.type = (data['type'] != null) ? data['type'].toString() : '';
    this.popularity = (data['popularity'] != null)
        ? double.parse(data['popularity'].toString())
        : 0.0;
    this.voteAverage = (data['vote_average'] != null)
        ? double.parse(data['vote_average'].toString())
        : 0.0;
    this.voteCount = (data['vote_count'] != null) ? data['vote_count'] : 0;
    this.numberOfSeasons =
        (data['number_of_seasons'] != null) ? data['number_of_seasons'] : 0;
    this.numberOfEpisodes =
        (data['number_of_episodes'] != null) ? data['number_of_episodes'] : 0;
    this.posterPath =
        (data['poster_path'] != null) ? data['poster_path'].toString() : '';
    this.backdropPath =
        (data['backdrop_path'] != null) ? data['backdrop_path'].toString() : '';

    if (data['genre_ids'] != null) {
      final List<dynamic> genreIdsList = data['genre_ids'];
      genreIdsList.forEach((genreId) {
        genreIds.add(genreId);
      });
    }

    if (data['networks'] != null) {
      final List<dynamic> networkList = data['networks'];
      networkList.forEach((nw) {
        networks.add(ProductionCompany.fromJSON(nw));
      });
    }

    if (data['production_companies'] != null) {
      final List<dynamic> pcList = data['production_companies'];
      pcList.forEach((pc) {
        productionCompanies.add(ProductionCompany.fromJSON(pc));
      });
    }

    if (data['seasons'] != null) {
      final List<dynamic> seasonList = data['seasons'];
      seasonList.forEach((season) {
        seasons.add(Season.fromJSON(season));
      });
    }

    if (data['created_by'] != null) {}
  }
}
