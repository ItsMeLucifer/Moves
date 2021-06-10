import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/MainScreen.dart';
import 'package:productivity/ViewModels/FirebaseService.dart';
import 'package:productivity/main.dart';
import 'package:productivity/pages/welcome_page.dart';



class Wrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final firebaseServiceVM = watch(firebaseServiceViewModel);
    switch (firebaseServiceVM.status) {
      case Status.Unauthenticated:
        return WelcomePage();
        break;
      case Status.Authenticated:
        return HomeScreen();
        break;
      default:
        return WelcomePage();
    }
  }
}
