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
