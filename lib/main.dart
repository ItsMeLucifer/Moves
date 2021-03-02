import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/home_screen.dart';
import 'package:productivity/view%20model/app_handler.dart';
import 'package:productivity/view%20model/firebase.dart';

final appHandler = ChangeNotifierProvider((_) => AppHandler());
final firebaseVM = ChangeNotifierProvider((_) => Firebase());
void main() async {
  //await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Productivity',
        home: HomeScreen());
  }
}
