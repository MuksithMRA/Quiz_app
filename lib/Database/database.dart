import 'package:quiz_app/models/user_model.dart';

import '../models/answer_model.dart';
import '../models/quiz.dart';
import '../models/score_tile.dart';
import '../models/test_model.dart';

class Database {
  static List<TestModel> testTileData = [
    TestModel(
      testName: "1st Term",
      subject: "Physics",
      author: UserModel(),
      quizQty: 50,
      isDone: false,
      mark: 80,
      quizList: [
        Quiz(
          quiz: "Is Flutter Free",
          answers: [
            AnswerModel(
              id: 1,
              answer: "Yes",
            ),
            AnswerModel(
              id: 2,
              answer: "No",
            ),
          ],
          correctAnswer: AnswerModel(
            id: 1,
            answer: "Yes",
          ),
        ),
      ],
    ),
  ];

  static List<ScoreTile> scoreList =
      testTileData.where((element) => element.isDone).toList().map((item) {
    return ScoreTile(
      leadingImg: item.image,
      title: item.testName,
      mark: item.mark,
    );
  }).toList();
}
