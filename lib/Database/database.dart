import '../models/answer_model.dart';
import '../models/quiz.dart';
import '../models/score_tile.dart';
import '../models/test_tile.dart';

class Database {
  static List<TestTile> testTileData = [
    TestTile(
      testName: "1st Term",
      subject: "Physics",
      author: "Mr Saman",
      quizQty: "50",
      isDone: true,
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

  //ScoreTileData
  static List<ScoreTile> scoreList =
      testTileData.where((element) => element.isDone).toList().map((item) {
    return ScoreTile(
      leadingImg: item.image,
      title: item.testName,
      mark: item.mark,
    );
  }).toList();
}
