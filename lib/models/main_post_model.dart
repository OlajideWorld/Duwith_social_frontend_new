class Post {
  String id;
  String user;
  String content;
  List<String> categories;
  bool commentsEnabled;
  bool showCaption;
  bool showLikes;
  Media media;
  String caption;
  List<Interaction> likes;
  List<Interaction> dislikes;
  List<Comment> comments;
  Earnings earnings;
  Withdrawal withdrawal;
  DateTime createdAt;

  Post({
    required this.id,
    required this.user,
    required this.content,
    required this.categories,
    required this.commentsEnabled,
    required this.showCaption,
    required this.showLikes,
    required this.media,
    required this.caption,
    required this.likes,
    required this.dislikes,
    required this.comments,
    required this.earnings,
    required this.withdrawal,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      user: json['user'],
      content: json['content'],
      categories: List<String>.from(json['categories']),
      commentsEnabled: json['commentsEnabled'],
      showCaption: json['showCaption'],
      showLikes: json['showLikes'],
      media: Media.fromJson(json['media']),
      caption: json['caption'],
      likes:
          (json['likes'] as List).map((i) => Interaction.fromJson(i)).toList(),
      dislikes: (json['dislikes'] as List)
          .map((i) => Interaction.fromJson(i))
          .toList(),
      comments:
          (json['comments'] as List).map((c) => Comment.fromJson(c)).toList(),
      earnings: Earnings.fromJson(json['earnings']),
      withdrawal: Withdrawal.fromJson(json['withdrawal']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user,
      'content': content,
      'categories': categories,
      'commentsEnabled': commentsEnabled,
      'showCaption': showCaption,
      'showLikes': showLikes,
      'media': media.toJson(),
      'caption': caption,
      'likes': likes.map((i) => i.toJson()).toList(),
      'dislikes': dislikes.map((i) => i.toJson()).toList(),
      'comments': comments.map((c) => c.toJson()).toList(),
      'earnings': earnings.toJson(),
      'withdrawal': withdrawal.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Media {
  String type;
  String url;

  Media({
    required this.type,
    required this.url,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
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
