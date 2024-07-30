// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:ffi';

class User {
  String id;
  String username;
  String useruniqueId;
  String email;
  String otp;
  String profileImage;
  String bio;
  String gender;
  DateTime dateOfBirth;
  bool linked;
  String phoneNumber;
  Dog dog;
  Jar jar;
  SocialMediaLinks socialMediaLinks;
  List<dynamic> interests;
  int mainBalance;
  int dailyPoints;
  int gemspoint;
  List<dynamic> following;
  List<dynamic> followers;
  List<dynamic> blockedUsers;

  User({
    required this.id,
    required this.username,
    required this.useruniqueId,
    required this.email,
    required this.otp,
    required this.profileImage,
    required this.bio,
    required this.gender,
    required this.dateOfBirth,
    required this.linked,
    required this.phoneNumber,
    required this.dog,
    required this.jar,
    required this.socialMediaLinks,
    required this.interests,
    required this.mainBalance,
    required this.dailyPoints,
    required this.gemspoint,
    required this.following,
    required this.followers,
    required this.blockedUsers,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        useruniqueId: json["useruniqueId"],
        email: json["email"],
        otp: json["otp"],
        profileImage: json["profile_image"],
        bio: json["bio"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        linked: json["linked"],
        phoneNumber: json["phoneNumber"],
        dog: Dog.fromJson(json["dog"]),
        jar: Jar.fromJson(json["jar"]),
        socialMediaLinks: SocialMediaLinks.fromJson(json["socialMediaLinks"]),
        interests: List<dynamic>.from(json["interests"].map((x) => x)),
        mainBalance: json["mainBalance"],
        dailyPoints: json["dailyPoints"],
        gemspoint: json["gemspoint"],
        following: List<dynamic>.from(json["following"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        blockedUsers: List<dynamic>.from(json["blockedUsers"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "username": username,
  //       "useruniqueId": useruniqueId,
  //       "email": email,
  //       "otp": otp,
  //       "profile_image": profileImage,
  //       "bio": bio,
  //       "gender": gender,
  //       "dateOfBirth": dateOfBirth.toIso8601String(),
  //       "linked": linked,
  //       "phoneNumber": phoneNumber,
  //       "dog": dog.toJson(),
  //       "jar": jar.toJson(),
  //       "socialMediaLinks": socialMediaLinks.toJson(),
  //       "interests": List<dynamic>.from(interests.map((x) => x)),
  //       "mainBalance": mainBalance,
  //       "dailyPoints": dailyPoints,
  //       "gemspoint": gemspoint,
  //       "following": List<dynamic>.from(following.map((x) => x)),
  //       "followers": List<dynamic>.from(followers.map((x) => x)),
  //       "blockedUsers": List<dynamic>.from(blockedUsers.map((x) => x)),
  //     };
}

class Dog {
  String dogName;
  int dogreward;

  Dog({
    required this.dogName,
    required this.dogreward,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        dogName: json["dogName"],
        dogreward: json["dogreward"],
      );

  Map<String, dynamic> toJson() => {
        "dogName": dogName,
        "dogreward": dogreward,
      };
}

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
