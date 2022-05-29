import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Database/database.dart';
import 'package:quiz_app/Widgets/common/snackbar.dart';

class RadBtn extends ChangeNotifier {
  int? answerIndex;
  int quizIndex = 0;
  int tileIndex = 0;
  bool isCorrect = false;
  int mark = 0;

  onChange(val, BuildContext context) {
    var item = Database.testTileData[tileIndex].quizList[quizIndex];
    answerIndex = val;
    notifyListeners();

    if (item.answer[val] == item.correctAnswer) {
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
    var item = Database.testTileData[tileIndex];
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
      print(marks);
      notifyListeners();
    }
  }
}
