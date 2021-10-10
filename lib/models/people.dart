//
//  People.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

class People {
  final int id;
  final int imdbId;
  final String name;
  final String alias;
  final int gender;
  final String birthdate;
  final String placeOfBirth;
  final bool adult;
  final String deathDate;
  final String bio;
  final String profilePath;

  People(
      {required this.id,
      required this.imdbId,
      required this.name,
      required this.alias,
      required this.gender,
      required this.birthdate,
      required this.placeOfBirth,
      required this.adult,
      required this.deathDate,
      required this.bio,
      required this.profilePath});
}
