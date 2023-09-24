import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/storage_keys.dart';
import '../main.dart';
import '../models/user_model.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String> registerWithEmailAndPassword(
      UserModel userModel) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      if (userCredential.user != null) {
        prefs.setString(StorageKeys.uid, userCredential.user!.uid);
        userCredential.user!
            .updateDisplayName("${userModel.firstName} ${userModel.lastName}");
        return "";
      } else {
        return "Something went wrong !";
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return e.message ?? "Something went wrong!";
    } on FirebaseException catch (e) {
      return e.message ?? "Something went wrong!";
    } on Exception catch (ex) {
      return ex.toString();
    }
  }

  static Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      prefs.setString(StorageKeys.uid, credential.user!.uid);
      return "";
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return e.message ?? "Something went wrong!";
    } on FirebaseException catch (e) {
      return e.message ?? "Something went wrong!";
    } on Exception catch (ex) {
      return ex.toString();
    }
  }
}
