import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Register with Email And Password
  Future<String?> registerWithEmailAndPassword(
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


  //Sign in with Email And Password
  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
