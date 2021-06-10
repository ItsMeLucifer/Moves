import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Settings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    final firebase = watch(firebaseServiceViewModel);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: handler.secondaryColor,
                  border: Border.all(color: handler.primaryColor, width: 5),
                  borderRadius: BorderRadius.circular(15)),
              child: FlatButton(
                  onPressed: () {
                    firebase.signOut();
                  },
                  child: Text(
                    'Sign out!',
                    style: TextStyle(
                        color: handler.textColor,
                        fontFamily: handler.fontFamily,
                        shadows: [handler.textShadow]),
                  )))
        ],
      ),
    );
  }
}
