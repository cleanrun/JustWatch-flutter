//
//  Movie.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'genre.dart';
import 'production_company.dart';

class Movie {
  late int id;
  late String imdbId;
  late String title;
  late String originalTitle;
  late String originalLanguage;
  late String overview;
  late int runtime;
  late int budget;
  late double popularity;
  late String posterPath;
  late String backdropPath;
  late String releaseDate;
  late String status;
  late double voteAverage;
  late int voteCount;
  List<int> genreIds = [];
  List<Genre> genres = [];
  List<ProductionCompany> productionCompanies = [];

  Movie(
      {required this.id,
      required this.imdbId,
      required this.title,
      required this.originalTitle,
      required this.originalLanguage,
      required this.overview,
      required this.runtime,
      required this.budget,
      required this.popularity,
      required this.posterPath,
      required this.backdropPath,
      required this.releaseDate,
      required this.status,
      required this.voteAverage,
      required this.voteCount,
      required this.genreIds,
      required this.genres,
      required this.productionCompanies});

  Movie.fromJSON(dynamic data) {
    this.id = data['id'];
    this.imdbId = (data['imdb_id'] != null) ? data['imdb_id'] : '';
    this.title = (data['title'] != null) ? data['title'] : '';
    this.originalTitle =
        (data['original_title'] != null) ? data['original_title'] : '';
    this.overview = (data['overview'] != null) ? data['overview'] : '';
    this.runtime = (data['runtime'] != null) ? data['runtime'] : 0;
    this.budget = (data['budget'] != null) ? data['budget'] : 0;
    this.popularity = (data['popularity'] != null)
        ? double.parse(data['popularity'].toString())
        : 0.0;
    this.posterPath = (data['poster_path'] != null) ? data['poster_path'] : '';
    this.backdropPath =
        (data['backdrop_path'] != null) ? data['backdrop_path'] : '';
    this.releaseDate =
        (data['release_date'] != null) ? data['release_date'] : '';
    this.status = (data['status'] != null) ? data['status'] : '';
    this.voteAverage = (data['vote_average'] != null)
        ? double.parse(data['vote_average'].toString())
        : 0.0;
    this.voteCount = (data['vote_count'] != null) ? data['vote_count'] : 0;

    if (data['genre_ids'] != null) {
      final List<dynamic> genreIdsList = data['genre_ids'];
      genreIdsList.forEach((genreId) {
        genreIds.add(genreId);
      });
    }

    if (data['genres'] != null) {
      final List<dynamic> genreList = data['genres'];
      genreList.forEach((genre) {
        genres.add(Genre.fromJSON(genre));
      });
    }

    if (data['production_companies'] != null) {
      final List<dynamic> pcList = data['production_companies'];
      pcList.forEach((pc) {
        productionCompanies.add(ProductionCompany.fromJSON(pc));
      });
    }
  }
}
