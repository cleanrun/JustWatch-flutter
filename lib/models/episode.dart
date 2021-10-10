//
//  Episode.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

class Episode {
  final int id;
  final String name;
  final String airDate;
  final int episodeNumber;
  final int seasonNumber;
  final String productionCode;
  final String overview;
  final double voteAverage;
  final int voteCount;

  Episode(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episodeNumber,
      required this.seasonNumber,
      required this.productionCode,
      required this.overview,
      required this.voteAverage,
      required this.voteCount});
}
