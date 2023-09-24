import 'package:quiz_app/constants/images.dart';
import 'package:quiz_app/models/quiz.dart';

class TestTile {
  String image;
  String testName;
  String subject;
  String author;
  String quizQty;
  bool isDone;
  int mark;
  List<Quiz> quizList;

  TestTile({
    this.image = testimg,
    required this.testName,
    required this.subject,
    required this.author,
    required this.quizQty,
    this.isDone = false,
    this.mark = 0,
    required this.quizList,
  });
}
