import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/user_model.dart';

class UserService {
  static final userCollection = FirebaseFirestore.instance.collection('users');
  static Future<String> addUser(UserModel userModel) async {
    try {
      await userCollection.add(userModel.toMap());
      return "";
    } on FirebaseException catch (ex) {
      debugPrint(ex.toString());
      return ex.message ?? "Something went wrong !";
    } on Exception catch (ex) {
      debugPrint(ex.toString());
      return ex.toString();
    }
  }

  static Future<UserModel?> getUser(String userId) async {
    try {
      Query<Map<String, dynamic>> query =
          userCollection.where('uid', isEqualTo: userId.toString());

      QuerySnapshot<Map<String, dynamic>> value = await query.get();
      UserModel user = UserModel.fromMap(value.docs.first.data());
      return user;
    } on FirebaseException catch (ex) {
      debugPrint(ex.toString());
      return null;
    } on Exception catch (ex) {
      debugPrint(ex.toString());
      return null;
    }
  }
}
