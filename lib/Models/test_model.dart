import 'dart:convert';
import 'package:quiz_app/models/user_model.dart';
import '../constants/images.dart';
import 'quiz.dart';

class TestModel {
  String image;
  String testName;
  String subject;
  UserModel? author;
  int quizQty;
  String description;
  List<Quiz> quizList;
  int allocatedTime;
  bool isDone;
  int mark;

  TestModel({
    this.image = testimg,
    this.testName = "",
    this.subject = "",
    this.author,
    this.quizQty = 0,
    this.quizList = const [],
    this.description = "",
    this.allocatedTime = 0,
    this.isDone = false,
    this.mark = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': testName,
      'subject': subject,
      'author': author!.toMap(),
      'qty': quizQty,
      'quiz_list': quizList.map((x) => x.toMap()).toList(),
      "description": description,
      "allocated_time": allocatedTime,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      image: map['image'] ?? "",
      testName: map['name'] ?? "",
      subject: map['subject'] ?? "",
      author: map['author'] != null ? UserModel.fromMap(map['author']) : null,
      quizQty: map['qty'] ?? 0,
      quizList: List<Quiz>.from(
        (map['quiz_list'] ?? []).map<Quiz>(
          (x) => Quiz.fromMap(x as Map<String, dynamic>),
        ),
      ),
      description: map['description'] ?? "",
      allocatedTime: map['allocated_time'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) =>
      TestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
