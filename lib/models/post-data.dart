// ignore_for_file: file_names

class PostsData {
  final String name;
  final String image;
  final String content;
  final int likes;
  final int dislikes;
  final int postType;
  final int comment;

  PostsData(
      {required this.name,
      required this.postType,
      required this.image,
      required this.content,
      required this.likes,
      required this.dislikes,
      required this.comment});
}

class PostForYou {
  final String id;
  final List<Media> media;
  final String caption;
  final int likes;
  final int dislikes;
  final int commentsCount;
  final UserProfile user;

  PostForYou({
    required this.id,
    required this.media,
    required this.caption,
    required this.likes,
    required this.dislikes,
    required this.commentsCount,
    required this.user,
  });

  factory PostForYou.fromJson(Map<String, dynamic> json) {
    return PostForYou(
      id: json['_id'],
      media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      caption: json['caption'],
      likes: json['likes'].length,
      dislikes: json['dislikes'].length,
      commentsCount: json['comments'].length,
      user: UserProfile.fromJson(json['user']),
    );
  }
}

class Media {
  final String type;
  final String url;

  Media({required this.type, required this.url});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      url: json['url'],
    );
  }
}

class UserProfile {
  final String id;
  final String username;
  final String profileImage;

  UserProfile({
    required this.id,
    required this.username,
    required this.profileImage,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'],
      username: json['username'],
      profileImage: json['profile_image'],
    );
  }
}
