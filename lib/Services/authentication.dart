import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/storage_keys.dart';
import 'package:quiz_app/main.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  //Register with Email And Password
  static Future<String?> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      debugPrint(userCredential.user!.uid);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code.toString());
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
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
    } catch (e) {
      return e.toString();
    }
  }
}
