import '../constants/images.dart';
import 'quiz.dart';

class TestTile {
  String image;
  String testName;
  String subject;
  String author;
  int quizQty;
  bool isDone;
  int mark;
  List<Quiz> quizList;

  TestTile({
    this.image = testimg,
    this.testName = "",
    this.subject = "",
    this.author = "",
    this.quizQty = 0,
    this.isDone = false,
    this.mark = 0,
    this.quizList = const [],
  });
}
