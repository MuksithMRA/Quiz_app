import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/test_model.dart';

class TestService {
  static final testCollection = FirebaseFirestore.instance.collection('tests');

  static Future<String> addTest(TestModel test) async {
    try {
      await testCollection.add(test.toMap());
      return "";
    } on FirebaseException catch (ex) {
      return ex.message ?? "";
    } on Exception catch (ex) {
      return ex.toString();
    }
  }

  static Future<List<TestModel>?> getAllTests() async {
    try {
      List<TestModel> testList = [];
      await testCollection.get().then((value) {
        testList = value.docs.map((e) => TestModel.fromMap(e.data())).toList();
      });
      return testList;
    } on FirebaseException catch (ex) {
      debugPrint(ex.message.toString());
      return null;
    } on Exception catch (ex) {
      debugPrint(ex.toString());
      return null;
    }
  }
}
