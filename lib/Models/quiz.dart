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
}
