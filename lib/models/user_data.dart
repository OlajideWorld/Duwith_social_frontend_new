// User model

class User {
  final String id;
  final String username;
  final String email;
  final String otp;
  final String profileImage;
  final String bio;
  final String gender;
  final DateTime dateOfBirth;
  final bool linked;
  final String phoneNumber;
  final double mainBalance;
  final double dailyPoints;
  final double gemspoint;
  final Jar jar;
  final List<String> following;
  final List<String> followers;
  final List<String> interests;
  final SocialMediaLinks socialMediaLinks;
  final List<String> blockedUsers;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.otp,
    required this.profileImage,
    required this.bio,
    required this.gender,
    required this.dateOfBirth,
    required this.linked,
    required this.phoneNumber,
    required this.mainBalance,
    required this.dailyPoints,
    required this.gemspoint,
    required this.jar,
    required this.following,
    required this.followers,
    required this.interests,
    required this.socialMediaLinks,
    required this.blockedUsers,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      otp: json["otp"],
      profileImage: json['profile_image'],
      bio: json['bio'],
      gender: json['gender'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      linked: json['linked'],
      phoneNumber: json['phoneNumber'],
      mainBalance: json['mainBalance'].toDouble(),
      gemspoint: json["gemspoint"].toDouble(),
      dailyPoints: json["dailyPoints"].toDouble(),
      jar: Jar.fromJson(json['jar']),
      following: List<String>.from(json['following']),
      followers: List<String>.from(json['followers']),
      interests: List<String>.from(json['interests']),
      socialMediaLinks: SocialMediaLinks.fromJson(json['socialMediaLinks']),
      blockedUsers: List<String>.from(json['blockedUsers']),
    );
  }
}

class Jar {
  final int points;
  final bool purchased;
  final int limit;
  final int totalEarned;

  Jar({
    required this.points,
    required this.purchased,
    required this.limit,
    required this.totalEarned,
  });

  factory Jar.fromJson(Map<String, dynamic> json) {
    return Jar(
      points: json['points'],
      purchased: json['purchased'],
      limit: json['limit'],
      totalEarned: json['totalEarned'],
    );
  }
}

class SocialMediaLinks {
  final String facebook;
  final String youtube;

  SocialMediaLinks({
    required this.facebook,
    required this.youtube,
  });

  factory SocialMediaLinks.fromJson(Map<String, dynamic> json) {
    return SocialMediaLinks(
      facebook: json['facebook'] ?? '',
      youtube: json['youtube'] ?? '',
    );
  }
}
