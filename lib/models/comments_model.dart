class Comment {
  String id;
  String post;
  String user;
  String content;
  String parentComment;
  List<Comment> replies;
  DateTime createdAt;

  Comment({
    required this.id,
    required this.post,
    required this.user,
    required this.content,
    this.parentComment = '',
    this.replies = const [],
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'],
      post: json['post'],
      user: json['user'],
      content: json['content'],
      parentComment: json['parentComment'] ?? '',
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
