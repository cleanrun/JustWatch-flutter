//
//  Review.dart
//  JustWatch
//
//  Created by cleanmac on 27/09/21.
//

import 'author.dart';

class Review {
  final String id;
  final Author author;
  final String authorName;
  final String content;
  final String createdAt;
  final String url;
  final int mediaId;
  final String mediaTitle;
  final String mediaType;

  Review(
      {required this.id,
      required this.author,
      required this.authorName,
      required this.content,
      required this.createdAt,
      required this.url,
      required this.mediaId,
      required this.mediaTitle,
      required this.mediaType});
}
