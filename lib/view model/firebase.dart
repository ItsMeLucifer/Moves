import 'package:flutter/material.dart';

class Firebase extends ChangeNotifier {
  //_________AUTHENTICATION_________

  void login() {
    //LOGIN
  }
  void register() {
    //REGISTER
  }
  void logout() {
    //LOGOUT
  }

  //_________DATA HANDLING_________

  void sendProductivityData(int value, dynamic date) {
    //SEND TO FIREBASE SERVER
  }

  void sendProject(
      String name, String tags, String description, double progress) {
    //SEND PROJECT TO FIREBASE SERVER
  }
}
