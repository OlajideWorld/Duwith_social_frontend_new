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
  List<dynamic> comments;
  final String id;
  List<NewsInteraction> likes;
  List<NewsInteraction> dislikes;
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
        likes: (json['likes'] as List)
            .map((i) => NewsInteraction.fromJson(i))
            .toList(),
        dislikes: (json['likes'] as List)
            .map((i) => NewsInteraction.fromJson(i))
            .toList(),
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

class NewsInteraction {
  String user;
  DateTime createdAt;

  NewsInteraction({
    required this.user,
    required this.createdAt,
  });

  factory NewsInteraction.fromJson(Map<String, dynamic> json) {
    return NewsInteraction(
      user: json['user'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
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
