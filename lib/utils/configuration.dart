//
//  Configuration.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

class Configuration {
  static const URL_BASE = 'api.themoviedb.org';
  static const URL_IMG_BASE = 'https://image.tmdb.org/t/p/w500';
  static const API_KEY = 'configure this with an API key';

  static const MOVIE_GENRE_ACTION = '28';
  static const MOVIE_GENRE_ADVENTURE = '12';
  static const MOVIE_GENRE_ANIMATION = '16';
  static const MOVIE_GENRE_COMEDY = '35';
  static const MOVIE_GENRE_CRIME = '80';
  static const MOVIE_GENRE_DOCUMENTARY = '99';
  static const MOVIE_GENRE_DRAMA = '18';
  static const MOVIE_GENRE_FAMILY = '10751';
  static const MOVIE_GENRE_FANTASY = '14';
  static const MOVIE_GENRE_HISTORY = '36';
  static const MOVIE_GENRE_HORROR = '27';
  static const MOVIE_GENRE_MUSIC = '10402';
  static const MOVIE_GENRE_MYSTERY = '9648';
  static const MOVIE_GENRE_ROMANCE = '10749';
  static const MOVIE_GENRE_SCIFI = '878';
  static const MOVIE_GENRE_TV_MOVIE = '10770';
  static const MOVIE_GENRE_THRILLER = '53';
  static const MOVIE_GENRE_WAR = '10752';
  static const MOVIE_GENRE_WESTERN = '37';

  static String getMovieGenreName(int id) {
    switch (id) {
      case 28:
        return 'Action';
      case 12:
        return 'Adventure';
      case 16:
        return 'Animation';
      case 35:
        return 'Comedy';
      case 80:
        return 'Crime';
      case 99:
        return 'Documentary';
      case 18:
        return 'Drama';
      case 10751:
        return 'Family';
      case 14:
        return 'Fantasy';
      case 36:
        return 'History';
      case 27:
        return 'Horror';
      case 10402:
        return 'Music';
      case 9648:
        return 'Mystery';
      case 10749:
        return 'Romance';
      case 878:
        return 'Sci-Fi';
      case 10770:
        return 'TV Movie';
      case 53:
        return 'Thriller';
      case 10752:
        return 'War';
      case 37:
        return 'Western';
      default:
        return 'Unknown';
    }
  }

  static const MOVIE_GENRE_ALL = [
    28,
    12,
    16,
    35,
    80,
    99,
    18,
    10751,
    14,
    36,
    27,
    10402,
    9648,
    10749,
    878,
    10770,
    53,
    10752,
    37
  ];

  static const TV_GENRE_ACTION_ADVENTURE = '10759';
  static const TV_GENRE_ANIMATION = '16';
  static const TV_GENRE_COMEDY = '35';
  static const TV_GENRE_CRIME = '80';
  static const TV_GENRE_DOCUMENTARY = '99';
  static const TV_GENRE_DRAMA = '18';
  static const TV_GENRE_FAMILY = '10751';
  static const TV_GENRE_KIDS = '10762';
  static const TV_GENRE_MYSTERY = '9648';
  static const TV_GENRE_NEWS = '10763';
  static const TV_GENRE_REALITY = '10764';
  static const TV_GENRE_SCIFI_FANTASY = '10765';
  static const TV_GENRE_SOAP = '10766';
  static const TV_GENRE_TALK = '10767';
  static const TV_GENRE_WAR_POLITICS = '10768';
  static const TV_GENRE_WESTERN = '37';

  static String getTvGenreName(int id) {
    switch (id) {
      case 10759:
        return 'Action Adventure';
      case 16:
        return 'Animation';
      case 35:
        return 'Comedy';
      case 80:
        return 'Crime';
      case 99:
        return 'Documentary';
      case 18:
        return 'Drama';
      case 10751:
        return 'Family';
      case 10762:
        return 'Kids';
      case 9648:
        return 'Mystery';
      case 10763:
        return 'News';
      case 10764:
        return 'Reality';
      case 10765:
        return 'Sci-Fi Fantasy';
      case 10766:
        return 'Soap';
      case 10767:
        return 'Talkshow';
      case 10768:
        return 'War Politics';
      case 37:
        return 'Western';
      default:
        return 'Unknown';
    }
  }

  static const TV_GENRE_ALL = [
    10759,
    16,
    35,
    80,
    99,
    18,
    10751,
    10762,
    9648,
    10763,
    10764,
    10765,
    10766,
    10767,
    10768,
    37
  ];
}
