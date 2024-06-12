// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

class CommentModel {
  String id;
  String post;
  CommentUser user;
  String content;
  dynamic parentComment;
  // List<dynamic> replies;
  List<String> likes;
  String createdAt;

  CommentModel({
    required this.id,
    required this.post,
    required this.user,
    required this.content,
    required this.parentComment,
    // required this.replies,
    required this.likes,
    required this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["_id"],
        post: json["post"],
        user: CommentUser.fromJson(json["user"]),
        content: json["content"],
        parentComment: json["parentComment"],
        // replies: List<dynamic>.from(json["replies"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        createdAt: json["createdAt"],
      );
}

class CommentUser {
  String id;
  String username;
  String profileImage;

  CommentUser({
    required this.id,
    required this.username,
    required this.profileImage,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) => CommentUser(
        id: json["_id"],
        username: json["username"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "profile_image": profileImage,
      };
}
