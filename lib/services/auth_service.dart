import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/storage_keys.dart';
import '../main.dart';
import '../models/user_model.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<String> registerWithEmailAndPassword(
      UserModel userModel) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      if (userCredential.user != null) {
        userModel.uid = userCredential.user!.uid;
        await prefs.setString(StorageKeys.uid, userCredential.user!.uid);
        await userCredential.user!
            .updateDisplayName("${userModel.firstName} ${userModel.lastName}");
        await firestore.collection('users').add(userModel.toMap());
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
      if (credential.user != null) {
        prefs.setString(StorageKeys.uid, credential.user!.uid);
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
}
