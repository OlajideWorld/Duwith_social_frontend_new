import 'package:flutter/material.dart';

class SocialModel {
  String id;
  String socialLink;
  int reward;
  List<dynamic> completedBy;
  int v;

  SocialModel({
    required this.id,
    required this.socialLink,
    required this.reward,
    required this.completedBy,
    required this.v,
  });

  factory SocialModel.fromJson(Map<String, dynamic> json) => SocialModel(
        id: json["_id"],
        socialLink: json["socialLink"],
        reward: json["reward"],
        completedBy: List<dynamic>.from(json["completedBy"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "socialLink": socialLink,
        "reward": reward,
        "completedBy": List<dynamic>.from(completedBy.map((x) => x)),
        "__v": v,
      };
}

class PageEarnItem {
  final String title;
  final String subtitle;
  final String button;
  final Widget page;
  PageEarnItem(
      {required this.title,
      required this.subtitle,
      required this.button,
      required this.page});
}
