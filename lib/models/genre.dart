//
//  Genre.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

class Genre {
  late int id;
  late String name;

  Genre({required this.id, required this.name});

  Genre.fromJSON(dynamic data) {
    this.id = data['id'];
    this.name = data['name'].toString();
  }
}
