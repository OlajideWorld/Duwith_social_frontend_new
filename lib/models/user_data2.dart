// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class Jar {
  int points;
  bool purchased;
  int limit;
  int totalEarned;

  Jar({
    required this.points,
    required this.purchased,
    required this.limit,
    required this.totalEarned,
  });

  factory Jar.fromJson(Map<String, dynamic> json) => Jar(
        points: json["points"],
        purchased: json["purchased"],
        limit: json["limit"],
        totalEarned: json["totalEarned"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
        "purchased": purchased,
        "limit": limit,
        "totalEarned": totalEarned,
      };
}

class SocialMediaLinks {
  String facebook;
  String youtube;
  String instagram;
  String twitter;

  SocialMediaLinks({
    required this.facebook,
    required this.youtube,
    required this.instagram,
    required this.twitter,
  });

  factory SocialMediaLinks.fromJson(Map<String, dynamic> json) =>
      SocialMediaLinks(
        facebook: json["facebook"],
        youtube: json["youtube"],
        instagram: json["instagram"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "youtube": youtube,
        "instagram": instagram,
        "twitter": twitter,
      };
}
