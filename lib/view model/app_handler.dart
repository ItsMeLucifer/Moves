import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHandler extends ChangeNotifier {
  //_________COMMON_________
  Color get secondaryColor => Color.fromRGBO(20, 83, 80, 1);
  Color get primaryColor => Colors.white;
  Color get backgroundColor => Color.fromRGBO(29, 120, 116, 1);
  Color get tertiaryColor => Colors.black;
  Color get textColor => Colors.white;
  String get fontFamily => 'Clarity';
  Object get textShadow =>
      Shadow(blurRadius: 10.0, color: secondaryColor, offset: Offset(5.0, 5.0));

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

  //_________PROJECT CREATOR_________
  GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> get nameKey => _nameKey;
  String _projectName = '';
  String get projectName => _projectName;
  set projectName(String value) {
    _projectName = value;
    notifyListeners();
  }

  String _projectTags = '';
  String get projectTags => _projectTags;
  set projectTags(String value) {
    _projectTags = value;
    notifyListeners();
  }

  String _projectDescription = '';
  String get projectDescription => _projectDescription;
  set projectDescription(String value) {
    _projectDescription = value;
    notifyListeners();
  }

  double _projectProgress = 0;
  double get projectProgress => _projectProgress;
  set projectProgress(double value) {
    _projectProgress = value;
    notifyListeners();
  }

  void clearFields() {
    projectName = '';
    projectTags = '';
    projectDescription = '';
    projectProgress = 0;
  }
}
