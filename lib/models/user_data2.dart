// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//   String username;
//   String useruniqueId;
//   String email;
//   String otp;
//   String profileImage;
//   String bio;
//   String gender;
//   bool linked;
//   String phoneNumber;
//   List<dynamic> interests;
//   int mainBalance;
//   Jar jar;
//   List<dynamic> following;
//   List<dynamic> followers;
//   List<dynamic> blockedUsers;
//   SocialMediaLinks socialMediaLinks;
//   String id;

//   User({
//     required this.username,
//     required this.useruniqueId,
//     required this.email,
//     required this.otp,
//     required this.profileImage,
//     required this.bio,
//     required this.gender,
//     required this.linked,
//     required this.phoneNumber,
//     required this.interests,
//     required this.mainBalance,
//     required this.jar,
//     required this.following,
//     required this.followers,
//     required this.blockedUsers,
//     required this.socialMediaLinks,
//     required this.id,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         username: json["username"],
//         useruniqueId: json["useruniqueId"],
//         email: json["email"],
//         otp: json["otp"],
//         profileImage: json["profile_image"],
//         bio: json["bio"],
//         gender: json["gender"],
//         linked: json["linked"],
//         phoneNumber: json["phoneNumber"],
//         interests: List<dynamic>.from(json["interests"].map((x) => x)),
//         mainBalance: json["mainBalance"],
//         jar: Jar.fromJson(json["jar"]),
//         following: List<dynamic>.from(json["following"].map((x) => x)),
//         followers: List<dynamic>.from(json["followers"].map((x) => x)),
//         blockedUsers: List<dynamic>.from(json["blockedUsers"].map((x) => x)),
//         socialMediaLinks: SocialMediaLinks.fromJson(json["socialMediaLinks"]),
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "username": username,
//         "useruniqueId": useruniqueId,
//         "email": email,
//         "otp": otp,
//         "profile_image": profileImage,
//         "bio": bio,
//         "gender": gender,
//         "linked": linked,
//         "phoneNumber": phoneNumber,
//         "interests": List<dynamic>.from(interests.map((x) => x)),
//         "mainBalance": mainBalance,
//         "jar": jar.toJson(),
//         "following": List<dynamic>.from(following.map((x) => x)),
//         "followers": List<dynamic>.from(followers.map((x) => x)),
//         "blockedUsers": List<dynamic>.from(blockedUsers.map((x) => x)),
//         "socialMediaLinks": socialMediaLinks.toJson(),
//         "_id": id,
//       };
// }

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
