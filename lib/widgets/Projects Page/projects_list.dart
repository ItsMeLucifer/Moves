import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class ProjectsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Container(
            width: handler.screenWidth * 0.9,
            decoration: BoxDecoration(
                color: handler.secondaryColor,
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                width: handler.screenWidth * 0.7,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      CupertinoIcons.search,
                    ),
                    hintText: 'Search for project name',
                    border: InputBorder.none,
                    //Need to change the color of focusColor somehow
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: handler.screenWidth * 0.8,
          child: Text(
            '0 items',
            style: TextStyle(
                color: handler.textColor3,
                fontSize: 25,
                fontFamily: handler.fontFamily),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
