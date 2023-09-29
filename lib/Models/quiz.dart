import 'dart:convert';
import 'package:quiz_app/models/answer_model.dart';

class Quiz {
  String quiz;
  List<AnswerModel> answers;
  AnswerModel? correctAnswer;
  Quiz({
    this.quiz = "",
    this.answers = const [],
    this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quiz': quiz,
      'answers': answers.map((x) => x.toMap()).toList(),
      'correct_answer': correctAnswer?.toMap(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      quiz: map['quiz'] ?? "",
      answers: List<AnswerModel>.from(
        (map['answers'] ?? [] as List<int>).map<AnswerModel>(
          (x) => AnswerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      correctAnswer: map['correct_answer'] != null
          ? AnswerModel.fromMap(map['correct_answer'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);
}
