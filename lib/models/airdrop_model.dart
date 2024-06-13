// To parse this JSON data, do
//
//     final airdropModel = airdropModelFromJson(jsonString);

import 'dart:convert';

class AirdropModel {
  String id;
  String title;
  String airdropLogo;
  List<Media> media;
  String caption;
  List<String> participants;
  List<String> activities;
  String airdropLink;
  List<AirdropInteraction> likes;
  List<AirdropInteraction> dislikes;
  int comments;
  DateTime createdAt;
  int v;

  AirdropModel({
    required this.id,
    required this.title,
    required this.airdropLogo,
    required this.media,
    required this.caption,
    required this.participants,
    required this.activities,
    required this.airdropLink,
    required this.comments,
    required this.likes,
    required this.dislikes,
    required this.createdAt,
    required this.v,
  });

  factory AirdropModel.fromJson(Map<String, dynamic> json) => AirdropModel(
        id: json["_id"],
        title: json["title"],
        airdropLogo: json["airdrop_logo"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        caption: json["caption"],
        participants: List<String>.from(json["participants"].map((x) => x)),
        activities: List<String>.from(json["activities"].map((x) => x)),
        airdropLink: json["airdropLink"],
        likes: (json['likes'] as List)
            .map((i) => AirdropInteraction.fromJson(i))
            .toList(),
        dislikes: (json['dislikes'] as List)
            .map((i) => AirdropInteraction.fromJson(i))
            .toList(),
        comments: json["comments"].length,
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );
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

class AirdropInteraction {
  String user;
  DateTime createdAt;

  AirdropInteraction({
    required this.user,
    required this.createdAt,
  });

  factory AirdropInteraction.fromJson(Map<String, dynamic> json) {
    return AirdropInteraction(
      user: json['user'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
