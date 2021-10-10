//
//  IMDBUrl.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'configuration.dart';

class MoviesURL {
  static Map<String, String> queryParams = {
    'api_key': Configuration.API_KEY,
    'language': 'en-US',
    'page': '1'
  };

  static String getDetails(int id) => '/3/movie/$id';

  static String getAlternativeTitles(int id) =>
      '/3/movie/$id/alternative_titles';

  static String getCredits(int id) => '/3/movie/$id/credits';

  static String getImages(int id) => '/3/movie/$id/images';

  static String getKeywords(int id) => '/3/movie/$id/keywords';

  static String getReleaseDates(int id) => '/3/movie/$id/release_dates';

  static String getReviews(int id) => '/3/movie/$id/reviews';

  static String getSimiliarMovies(int id) => '/3/movie/$id/similar';

  static String getLatest = '/3/movie/latest';

  static String getNowPlaying = '/3/movie/now_playing';

  static String getPopular = '/3/movie/popular';

  static String getTopRated = '/3/movie/top_rated';

  static String getUpcoming = '/3/movie/upcoming';
}

class TVSeriesURL {
  static Map<String, String> queryParams = {
    'api_key': Configuration.API_KEY,
    'language': 'en-US',
    'page': '1'
  };

  static String getDetails(int id) => '/3/tv/$id';

  static String getAlternativeTitles(int id) => '/3/tv/$id/alternative_titles';

  static String getCredits(int id) => '/3/tv/$id/credits';

  static String getImages(int id) => '/3/tv/$id/images';

  static String getKeywords(int id) => '/3/tv/$id/keywords';

  static String getReviews(int id) => '/3/tv/$id/reviews';

  static String getSimiliar(int id) => '/3/tv/$id/similiar';

  static String getLatest = '/3/tv/latest';

  static String getAiringToday = '/3/tv/airing_today';

  static String getOnTheAir = '/3/tv/on_the_air';

  static String getPopular = '/3/tv/popular';

  static String getTopRated = '/3/tv/top_rated';

  static String getSeasonDetails(int id, int seasonId) =>
      '/3/tv/$id/season/$seasonId';

  static String getSeasonCredits(int id, int seasonId) =>
      '/3/tv/$id/season/$seasonId/credits';

  static String getSeasonImages(int id, int seasonId) =>
      '/3/tv/$id/season/$seasonId/images';

  static String getEpisodeDetails(int id, int seasonId, int episodeId) =>
      '/3/tv/$id/season/$seasonId/episode/$episodeId';

  static String getEpisodeCredits(int id, int seasonId, int episodeId) =>
      '/3/tv/$id/season/$seasonId/episode/$episodeId/credits';

  static String getEpisodeImages(int id, int seasonId, int episodeId) =>
      '/3/tv/$id/season/$seasonId/episode/$episodeId/images';
}

class PeopleURL {
  static Map<String, String> queryParams = {
    'api_key': Configuration.API_KEY,
    'language': 'en-US',
    'page': '1'
  };

  static String getDetails(int id) => '/3/person/$id';

  static String getMovieCredits(int id) => '/3/person/$id/movies_credits';

  static String getTvCredits(int id) => '/3/person/$id/tv_credits';

  static String getImages(int id) => '/3/person/$id/images';

  static String getLatest(int id) => '/3/person/$id/latest';

  static String getPopular(int id) => '/3/person/$id/popular';

  static String getReviewDetail(int id) => '/3/review/$id';
}

class SearchURL {
  static Map<String, String> queryParams(String query, int page) => {
        'api_key': Configuration.API_KEY,
        'language': 'en-US',
        'query': '$query',
        'page': '$page',
        'include_adult': 'false',
      };

  static String getCollections = '/3/search/collection';

  static String getKeywords = '/3/search/keyword';

  static String getMovies = '/3/search/movie';

  static String getPeople = '/3/search/person';

  static String getTvSeries = '/3/search/tv';
}
