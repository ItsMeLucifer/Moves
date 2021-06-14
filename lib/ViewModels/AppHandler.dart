import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

enum ProjectPageStatus { inProgress, complete, createNew }

class AppHandler extends ChangeNotifier {
  //_________COMMON_________
  Color get secondaryColor => Colors.white;
  Color get primaryColor => Color.fromRGBO(127, 127, 219, 1);
  Color get backgroundColor => Color.fromRGBO(238, 243, 251, 1);
  Color get tertiaryColor => Color.fromRGBO(177, 181, 205, 1);
  Color get quaternaryColor => Color.fromRGBO(186, 191, 202, 1);
  Color get textColor => Colors.white;
  Color get textColor2 => Color.fromRGBO(127, 127, 219, 1);
  Color get textColor3 => Color.fromRGBO(11, 72, 112, 1);
  Color get greyedOutColor => Colors.grey[400];
  String get fontFamily => 'Comfortaa';
  Object get textShadow =>
      Shadow(blurRadius: 10.0, color: Colors.black, offset: Offset(5.0, 5.0));

  double screenWidth = 0;

  //_________AUTHENTICATION PAGE____________
  bool _registerMode = false;
  bool get registerMode => _registerMode;
  set registerMode(bool value) {
    _registerMode = value;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController nicknameController = TextEditingController(text: '');

  //_________BOTTOM NAVIGATION BAR____________
  int _actualPageIndex = 0;
  int get actualPageIndex => _actualPageIndex;
  set actualPageIndex(int value) {
    _actualPageIndex = value;
    notifyListeners();
  }

  //_________PRODUCTIVITY_ASSESSMENT_________
  double _productivityLevel = 0;
  double get productivityLevel => _productivityLevel;
  set productivityLevel(double value) {
    _productivityLevel = value;
    notifyListeners();
  }

  Future<void> fetchTodayProductivityFromDatabase() async {
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("productivity")
        .doc(Jiffy(new DateTime.now()).format("dd.MM.y"))
        .get();
    var productivity = document.exists ? document['value'] : null;
    productivityLevel =
        productivity != null ? double.parse(productivity.toString()) : 0.0;
  }

  final List<String> emoji = [
    '😠',
    '😩',
    '😞',
    '😔',
    '😒',
    '😐',
    '😊',
    '😃',
    '😄',
    '😍',
    '😍'
  ];
  //PROJECTS PAGE
  ProjectPageStatus _projectPageStatus = ProjectPageStatus.inProgress;
  int get projectPageStatus => _projectPageStatus.index;
  set projectPageStatus(int value) {
    if (value == 0) {
      _projectPageStatus = ProjectPageStatus.inProgress;
    }
    if (value == 1) {
      _projectPageStatus = ProjectPageStatus.complete;
    }
    if (value == 2) {
      _projectPageStatus = ProjectPageStatus.createNew;
    }
    notifyListeners();
  }

  //_________PROJECT CREATOR_________
  GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> get nameKey => _nameKey;
}
