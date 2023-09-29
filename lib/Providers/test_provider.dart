import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/services/test_service.dart';
import '../database/database.dart';
import '../models/test_model.dart';
import '../widgets/common/snackbar.dart';

class TestProvider extends ChangeNotifier {
  List<TestModel> testList = [];

  Future<void> getAllTests() async {
    testList = await TestService.getAllTests() ?? [];
    notifyListeners();
  }

  int? answerIndex;
  int quizIndex = 0;
  int tileIndex = 0;
  bool isCorrect = false;
  int mark = 0;

  onChange(val, BuildContext context) {
    var item = Database.testTileData[tileIndex].quizList[quizIndex];
    answerIndex = val;
    notifyListeners();

    if (item.answers[val].answer == item.correctAnswer!.answer) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        color: Colors.green,
        text: "Correct Answer",
        icon: Icons.done,
      ));

      isCorrect = true;
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
        color: Colors.red,
        text: "Wrong Answer",
        icon: Icons.close,
      ));
      isCorrect = false;
      notifyListeners();
    }

    Timer(const Duration(milliseconds: 500), () {
      var item = Database.testTileData[tileIndex];
      if (quizIndex < item.quizList.length) {
        quizIndex++;
        answerIndex = null;
        notifyListeners();
      }
    });
  }

  onBack() {
    quizIndex = 0;
    answerIndex = null;
    mark = 0;
    notifyListeners();
  }

  setTileIndex(int tIndex) {
    tileIndex = tIndex;
    notifyListeners();
  }

  bool isFinish() {
    var item = testList[tileIndex];
    if (quizIndex >= item.quizList.length) {
      item.isDone = true;
      return true;
    }
    return false;
  }

  marking() {
    if (!isFinish()) {
      if (isCorrect) {
        mark = mark + 10;
        notifyListeners();
      }
    } else {
      var marks = Database.testTileData[tileIndex].mark;
      marks = mark;
      debugPrint(marks.toString());
      notifyListeners();
    }
  }
}
