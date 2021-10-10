//
//  ProductionCompanyItem.dart
//  JustWatch
//
//  Created by cleanmac on 04/10/21.
//

import 'package:flutter/material.dart';

import '/utils/configuration.dart';

import '/models/production_company.dart';

class ProductionCompanyItem extends StatelessWidget {
  ProductionCompany productionCompany;

  ProductionCompanyItem(this.productionCompany);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (productionCompany.logoPath != '')
                  ? FadeInImage.assetNetwork(
                      height: 80,
                      placeholder: 'assets/images/placeholder_movie_poster.png',
                      image: Configuration.URL_IMG_BASE +
                          productionCompany.logoPath,
                      fit: BoxFit.fitWidth,
                    )
                  : Container(
                      height: 80,
                      child: Center(
                        child: Icon(Icons.help_sharp),
                      ),
                    ),
              SizedBox(height: 10),
              Text(
                productionCompany.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ArialCE',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
