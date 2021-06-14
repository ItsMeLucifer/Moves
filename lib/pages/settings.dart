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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16),
            child: Text(
              "Settings",
              style: TextStyle(
                color: handler.textColor3,
                fontSize: 35,
                fontFamily: handler.fontFamily,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: handler.primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: FlatButton(
                    onPressed: () {
                      firebase.signOut();
                    },
                    child: Text(
                      'Sign out!',
                      style: TextStyle(
                        color: handler.textColor,
                        fontFamily: handler.fontFamily,
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
