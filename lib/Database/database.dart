import 'package:quiz_app/Models/quiz.dart';
import 'package:quiz_app/Models/score_tile.dart';

import 'package:quiz_app/Models/test_tile.dart';

class Database {
  //test Tile Data
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
          answer: ["Yes", "No", "Both", "none"],
          correctAnswer: "Yes",
        ),
        Quiz(
          quiz: "Is Flutter Cross Platform",
          answer: ["Yes", "No"],
          correctAnswer: "Yes",
        ),
      ],
    ),
    TestTile(
      testName: "2nd Term",
      subject: "Biology",
      author: "Mr Kuruppu",
      quizQty: "40",
      quizList: [
        Quiz(
          quiz: "Is Flutter Free",
          answer: ["Yes", "No", "Both", "none"],
          correctAnswer: "Yes",
        ),
        Quiz(
          quiz: "Is Flutter Cross Platform",
          answer: ["Yes", "No"],
          correctAnswer: "Yes",
        ),
      ],
    ),
    TestTile(
      testName: "3rd Term",
      subject: "Sinhala",
      author: "Mr Nimal",
      quizQty: "25",
      quizList: [
        Quiz(
          quiz: "Is Flutter Free",
          answer: ["Yes", "No", "Both", "none"],
          correctAnswer: "Yes",
        ),
        Quiz(
          quiz: "Is Flutter Cross Platform",
          answer: ["Yes", "No"],
          correctAnswer: "Yes",
        ),
      ],
    ),
    TestTile(
      testName: "4th Term",
      subject: "English",
      author: "Mr Saman",
      quizQty: "35",
      isDone: true,
      mark: 45,
      quizList: [
        Quiz(
          quiz: "Is Flutter Free",
          answer: ["Yes", "No", "Both", "none"],
          correctAnswer: "Yes",
        ),
        Quiz(
          quiz: "Is Flutter Cross Platform",
          answer: ["Yes", "No"],
          correctAnswer: "Yes",
        ),
      ],
    ),
    TestTile(
      testName: "5th Term",
      subject: "Geography",
      author: "Mr Kuruppu",
      quizQty: "15",
      isDone: true,
      mark: 65,
      quizList: [
        Quiz(
          quiz: "Is Flutter Free",
          answer: ["Yes", "No", "Both", "none"],
          correctAnswer: "Yes",
        ),
        Quiz(
          quiz: "Is Flutter Cross Platform",
          answer: ["Yes", "No"],
          correctAnswer: "Yes",
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
