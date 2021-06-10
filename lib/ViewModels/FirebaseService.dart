import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status { Authenticated, Unauthenticated }
enum ProductivityDataInfo { Existing, Nonexistent, Unspecified }

class FirebaseService extends ChangeNotifier {
  //_________AUTHENTICATION_________
  FirebaseAuth _auth;
  FirebaseAuth get auth => _auth;
  FirebaseService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }
  Status _status = Status.Unauthenticated;
  Status get status => _status;
  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  User _user;
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<void> register(String email, String password, String nickname) async {
    //Przy rejestracji dodatkowo musimy dodawać nickname od razu do bazy danych uzytkownikow na firestore
    try {
     await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    try {
      await createAnAccount(nickname);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  //_________DATA HANDLING_________
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Stream stream;
  //---ACCOUNT---
  Future<void> createAnAccount(String nickname) async {
    await users.doc(auth.currentUser.uid).set({
      //zmienic na add
      'email': auth.currentUser.email,
      'userId': auth.currentUser.uid,
      'nickname': nickname,
      'friends': ['baton120', 'persedi', 'nukeemann']
    });
  }

  //dodac funkcje updateAccount

  //---PROJECTS---
  Future<void> createProject(
      String name, String description) async {
    await users.doc(auth.currentUser.uid).collection('projects').add({
      'name': name,
      'description': description,
    });
  }

  Future<void> updateProject(String docId, String name, String tags,
      String description, double progress) async {
    await users
        .doc(auth.currentUser.uid)
        .collection('projects')
        .doc(docId)
        .set({
      'name': name,
      'tags': tags,
      'description': description,
      'progress': progress
    });
  }

  Future<void> deleteProject(String docId) async {
    await users
        .doc(auth.currentUser.uid)
        .collection('projects')
        .doc(docId)
        .delete();
  }

  //---PRODUCTIVITY ASSESSMENT---
  DocumentSnapshot doc;

  ProductivityDataInfo _documentExists = ProductivityDataInfo.Nonexistent;
  ProductivityDataInfo get documentExists => _documentExists;
  set documentExists(ProductivityDataInfo value) {
    _documentExists = value;
    notifyListeners();
  }

  Future<void> doesProductivityDataExists(dynamic date) async {
    documentExists = ProductivityDataInfo.Nonexistent;
    await users
        .doc(auth.currentUser.uid)
        .collection('productivity')
        .doc(date.toString())
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        documentExists = ProductivityDataInfo.Existing;
        doc = documentSnapshot;
      } else {
        documentExists = ProductivityDataInfo.Nonexistent;
      }
    });
  }

  Future<void> sendProductivityData(int value, dynamic date) async {
    await users
        .doc(auth.currentUser.uid)
        .collection('productivity')
        .doc(date.toString())
        .set({'value': value, 'date': date});
  }
  Future<void> createNewProject(String name, String description, bool completed) async {
    Map<String, dynamic> newDocument = {
      "name":name,
      "description": description,
      "completed": completed
    };
    await users
        .doc(auth.currentUser.uid)
        .collection('projects').add(newDocument);
  }
}
