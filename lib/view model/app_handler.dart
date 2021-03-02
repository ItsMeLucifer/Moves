import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHandler extends ChangeNotifier {
  //COMMON
  Color get secondaryColor => Color.fromRGBO(20, 83, 80, 1);
  Color get primaryColor => Colors.white;
  Color get backgroundColor => Color.fromRGBO(29, 120, 116, 1);
  Color get tertiaryColor => Colors.black;
  Color get textColor => Colors.white;
  String get fontFamily => 'Clarity';
  Object get textShadow =>
      Shadow(blurRadius: 10.0, color: secondaryColor, offset: Offset(5.0, 5.0));

  //BOTTOM NAVIGATION BAR
  int _actualPageIndex = 0;
  int get actualPageIndex => _actualPageIndex;
  set actualPageIndex(int value) {
    _actualPageIndex = value;
    notifyListeners();
  }

  //PRODUCTIVITY_ASSESSMENT
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
}
