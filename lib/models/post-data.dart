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

class QueryParams {
  final String userId;
  final List<String> following;
  final List<String> interests;
  final String sortby;

  QueryParams(
      {required this.userId,
      required this.following,
      required this.interests,
      required this.sortby});
}

class MediaStorage {
  final String type;
  final String url;

  MediaStorage({required this.type, required this.url});
}
