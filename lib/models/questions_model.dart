class QuestionModel {
  final String id;
  final String quizQuestion;
  final int reward;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String answer;
  int v;

  QuestionModel({
    required this.id,
    required this.quizQuestion,
    required this.reward,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.answer,
    required this.v,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["_id"],
        quizQuestion: json["quiz_question"],
        reward: json["reward"],
        question: json["question"],
        optionA: json["optionA"],
        optionB: json["optionB"],
        optionC: json["optionC"],
        optionD: json["optionD"],
        answer: json["answer"],
        v: json["__v"],
      );
}
