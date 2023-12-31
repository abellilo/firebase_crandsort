import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  //firebase auth instance
  final firebaseAuth = FirebaseAuth.instance;
  //cloud firestore
  final firestore = FirebaseFirestore.instance;

  //sign in
  Future signIn(String email, String password) async{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  //register user
  Future registerUser(String email, String password) async{
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //add user details
  Future addUser(String firstName, String lastName, String email, int age) async{
    await firestore.collection("users").add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  //signout
  Future signOut() async{
    await firebaseAuth.signOut();
  }
}