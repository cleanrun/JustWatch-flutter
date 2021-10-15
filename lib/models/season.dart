//
//  Season.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'episode.dart';

class Season {
  late int id;
  late String airDate;
  late String name;
  late String overview;
  late String posterPath;
  late int seasonNumber;
  late int episodeCount;
  List<Episode> episodes = [];

  Season(
      {required this.id,
      required this.airDate,
      required this.name,
      required this.overview,
      required this.posterPath,
      required this.seasonNumber,
      required this.episodeCount,
      required this.episodes});

  Season.fromJSON(dynamic data) {
    this.id = data['id'];
    this.airDate =
        (data['air_date'] != null) ? data['air_date'].toString() : '';
    this.name = data['name'];
    this.overview =
        (data['overview'] != null) ? data['overview'].toString() : '';
    this.posterPath =
        (data['poster_path'] != null) ? data['poster_path'].toString() : '';
    this.seasonNumber = data['season_number'];
    this.episodeCount = data['episode_count'];
  }
}
