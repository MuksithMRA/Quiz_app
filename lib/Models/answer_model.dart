// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnswerModel {
  int id;
  String answer;
  AnswerModel({
    this.id = 0,
    this.answer = "",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'answer': answer,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      id: map['id'] ?? 0,
      answer: map['answer'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
