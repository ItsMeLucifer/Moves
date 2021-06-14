import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Friends extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16),
            child: Text(
              "Friends List",
              style: TextStyle(
                color: handler.textColor3,
                fontSize: 35,
                fontFamily: handler.fontFamily,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Artur",
                    style: TextStyle(
                        fontFamily: handler.fontFamily, fontSize: 15))),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Bartek",
                    style: TextStyle(
                        fontFamily: handler.fontFamily, fontSize: 15))),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Arek",
                    style: TextStyle(
                        fontFamily: handler.fontFamily, fontSize: 15))),
          )
        ],
      )),
    );
  }
}
