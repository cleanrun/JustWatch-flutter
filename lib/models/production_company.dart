//
//  ProductionCompany.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

class ProductionCompany {
  late int id;
  late String name;
  late String logoPath;
  late String originCountry;

  ProductionCompany(
      {required this.id,
      required this.name,
      required this.logoPath,
      required this.originCountry});

  ProductionCompany.fromJSON(dynamic data) {
    this.id = data['id'];
    this.name = data['name'].toString();
    this.logoPath =
        (data['logo_path'] != null) ? data['logo_path'].toString() : '';
    this.originCountry = data['origin_country'].toString();
  }
}
