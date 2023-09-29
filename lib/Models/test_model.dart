import 'dart:convert';
import '../constants/images.dart';
import 'quiz.dart';

class TestModel {
  String image;
  String testName;
  String subject;
  String author;
  int quizQty;
  bool isDone;
  int mark;
  List<Quiz> quizList;

  TestModel({
    this.image = testimg,
    this.testName = "",
    this.subject = "",
    this.author = "",
    this.quizQty = 0,
    this.isDone = false,
    this.mark = 0,
    this.quizList = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': testName,
      'subject': subject,
      'author': author,
      'qty': quizQty,
      'quiz_list': quizList.map((x) => x.toMap()).toList(),
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      image: map['image'] ?? "",
      testName: map['name'] ?? "",
      subject: map['subject'] ?? "",
      author: map['author'] ?? "",
      quizQty: map['qty'] ?? 0,
      quizList: List<Quiz>.from(
        (map['quiz_list'] ?? []).map<Quiz>(
          (x) => Quiz.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) =>
      TestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
