import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/ViewModels/AppHandler.dart';
import 'package:productivity/ViewModels/FirebaseService.dart';
import 'package:productivity/wrapper.dart';


final appHandlerViewModel = ChangeNotifierProvider((_) => AppHandler());
final firebaseServiceViewModel =
    ChangeNotifierProvider((_) => FirebaseService.instance());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
