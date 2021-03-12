import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/home_screen.dart';
import 'package:productivity/main.dart';
import 'package:productivity/pages/authentication_page.dart';
import 'package:productivity/view%20model/firebase.dart';

class Wrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final firebase = watch(firebaseVM);
    switch (firebase.status) {
      case Status.Unauthenticated:
        return AuthenticationPage();
        break;
      case Status.Authenticated:
        return HomeScreen();
        break;
    }
  }
}
