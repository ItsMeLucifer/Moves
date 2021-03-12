import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/home_screen.dart';
import 'package:productivity/utilities/wrapper.dart';
import 'package:productivity/view%20model/app_handler.dart';
import 'package:productivity/view%20model/firebase.dart';
import 'package:firebase_core/firebase_core.dart' as fireBase;

final appHandler = ChangeNotifierProvider((_) => AppHandler());
final firebaseVM = ChangeNotifierProvider((_) => Firebase.instance());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await fireBase.Firebase.initializeApp();
  //await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Productivity',
        home: Wrapper());
  }
}
