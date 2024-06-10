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
  final bool commentsEnabled;
  final bool showCaption;
  final bool showLikes;
  final Earnings earnings;
  final Withdrawal withdrawal;
  final List<Media> media;
  final String caption;
  List<Interaction> likes;
  List<Interaction> dislikes;
  List<Comment> comments;
  final UserProfile user;

  PostForYou({
    required this.id,
    required this.commentsEnabled,
    required this.showCaption,
    required this.showLikes,
    required this.earnings,
    required this.withdrawal,
    required this.media,
    required this.caption,
    required this.likes,
    required this.dislikes,
    required this.comments,
    required this.user,
  });

  factory PostForYou.fromJson(Map<String, dynamic> json) {
    return PostForYou(
      id: json['_id'],
      commentsEnabled: json['commentsEnabled'],
      showCaption: json['showCaption'],
      showLikes: json['showLikes'],
      earnings: Earnings.fromJson(json['earnings']),
      withdrawal: Withdrawal.fromJson(json['withdrawal']),
      media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      caption: json['caption'],
      likes:
          (json['likes'] as List).map((i) => Interaction.fromJson(i)).toList(),
      dislikes: (json['dislikes'] as List)
          .map((i) => Interaction.fromJson(i))
          .toList(),
      comments:
          (json['comments'] as List).map((c) => Comment.fromJson(c)).toList(),
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

class Interaction {
  String user;
  DateTime createdAt;

  Interaction({
    required this.user,
    required this.createdAt,
  });

  factory Interaction.fromJson(Map<String, dynamic> json) {
    return Interaction(
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

class Comment {
  String id;
  String post;
  String user;
  String content;
  String? parentComment;
  List<Comment> replies;
  DateTime createdAt;

  Comment({
    required this.id,
    required this.post,
    required this.user,
    required this.content,
    this.parentComment,
    this.replies = const [],
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'],
      post: json['post'],
      user: json['user'],
      content: json['content'],
      parentComment: json['parentComment'],
      replies: (json['replies'] as List)
          .map((reply) => Comment.fromJson(reply))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'post': post,
      'user': user,
      'content': content,
      'parentComment': parentComment,
      'replies': replies.map((reply) => reply.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Earnings {
  double total;
  double limit;

  Earnings({
    required this.total,
    required this.limit,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return Earnings(
      total: json['total'].toDouble(),
      limit: json['limit'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'limit': limit,
    };
  }
}

class Withdrawal {
  double totalEarned;
  double available;

  Withdrawal({
    required this.totalEarned,
    required this.available,
  });

  factory Withdrawal.fromJson(Map<String, dynamic> json) {
    return Withdrawal(
      totalEarned: json['totalEarned'].toDouble(),
      available: json['available'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalEarned': totalEarned,
      'available': available,
    };
  }
}
