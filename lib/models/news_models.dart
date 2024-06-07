// To parse this JSON data, do
//
//     final newsUpdate = newsUpdateFromJson(jsonString);

import 'dart:convert';

NewsUpdate newsUpdateFromJson(String str) =>
    NewsUpdate.fromJson(json.decode(str));

String newsUpdateToJson(NewsUpdate data) => json.encode(data.toJson());

class NewsUpdate {
  final List<Media> media;
  final String caption;
  final List<dynamic> comments;
  final String id;
  final List<dynamic> likes;
  final List<dynamic> dislikes;
  final DateTime createdAt;

  NewsUpdate({
    required this.media,
    required this.caption,
    required this.comments,
    required this.id,
    required this.likes,
    required this.dislikes,
    required this.createdAt,
  });

  factory NewsUpdate.fromJson(Map<String, dynamic> json) => NewsUpdate(
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        caption: json["caption"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        id: json["_id"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        dislikes: List<dynamic>.from(json["dislikes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "caption": caption,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "_id": id,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "dislikes": List<dynamic>.from(dislikes.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Media {
  String type;
  String url;
  String id;

  Media({
    required this.type,
    required this.url,
    required this.id,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        url: json["url"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "_id": id,
      };
}
