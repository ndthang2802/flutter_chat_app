import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutheMethods {
  final _auth = FirebaseAuth.instance;

  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? newuser = userCredential.user;
      if (newuser != null) {
        return newuser.uid;
      } else {
        return Future.error('Register error, please try again');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('Email is already taken');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? newuser = userCredential.user;
      if (newuser != null) {
        return newuser.uid;
      } else {
        return Future.error('Login error, please try again');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Future.error('Wrong password provided for that user.');
      }
    }
  }

  Future updateProfile(data) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(data);
    } catch (e) {
      print(e.toString());
    }
  }
}
