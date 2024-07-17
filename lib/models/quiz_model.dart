// To parse this JSON data, do
//
//     final mainQuizModel = mainQuizModelFromJson(jsonString);

import 'dart:convert';

class MainQuizModel {
  String id;
  String quizName;
  String quizWriteUp;
  String category;
  String image;
  int maxreward;
  int quizTakers;
  List<String> quizQuestions;

  MainQuizModel({
    required this.id,
    required this.quizName,
    required this.quizWriteUp,
    required this.category,
    required this.image,
    required this.maxreward,
    required this.quizTakers,
    required this.quizQuestions,
  });

  factory MainQuizModel.fromJson(Map<String, dynamic> json) => MainQuizModel(
        id: json["_id"],
        quizName: json["quizName"],
        quizWriteUp: json["quizWriteUp"],
        category: json["category"],
        image: json["image"],
        maxreward: json["maxreward"],
        quizTakers: json["quizTakers"],
        quizQuestions: List<String>.from(json["quizQuestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "quizName": quizName,
        "quizWriteUp": quizWriteUp,
        "category": category,
        "image": image,
        "maxreward": maxreward,
        "quizTakers": quizTakers,
        "quizQuestions": List<dynamic>.from(quizQuestions.map((x) => x)),
      };
}
