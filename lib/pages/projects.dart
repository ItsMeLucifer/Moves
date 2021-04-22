import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:productivity/view%20model/app_handler.dart';
import 'package:productivity/widgets/Projects%20Page/create_new_project.dart';
import 'package:productivity/widgets/Projects%20Page/projects_list.dart';
import 'package:productivity/widgets/project_creator.dart';

class Projects extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: handler.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                width: handler.screenWidth * 0.8,
                child: Text(
                  'Your projects',
                  style: TextStyle(
                    color: handler.textColor3,
                    fontSize: 35,
                    fontFamily: handler.fontFamily,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: handler.screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: handler.secondaryColor,
                    borderRadius:
                        BorderRadius.circular(handler.screenWidth * 0.45)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          handler.projectPageStatus = 0;
                        },
                        child: Container(
                            height: 40,
                            width: handler.screenWidth * 0.27,
                            decoration: handler.projectPageStatus == 0
                                ? BoxDecoration(
                                    color: handler.primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                        ),
                                      ])
                                : BoxDecoration(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'In progress',
                                style: TextStyle(
                                    color: handler.projectPageStatus == 0
                                        ? handler.textColor
                                        : handler.textColor2,
                                    fontFamily: handler.fontFamily),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          handler.projectPageStatus = 1;
                        },
                        child: Container(
                            height: 40,
                            width: handler.screenWidth * 0.27,
                            decoration: handler.projectPageStatus == 1
                                ? BoxDecoration(
                                    color: handler.primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                        ),
                                      ])
                                : BoxDecoration(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Complete',
                                style: TextStyle(
                                    color: handler.projectPageStatus == 1
                                        ? handler.textColor
                                        : handler.textColor2,
                                    fontFamily: handler.fontFamily),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          handler.projectPageStatus = 2;
                        },
                        child: Container(
                            height: 40,
                            width: handler.screenWidth * 0.27,
                            decoration: handler.projectPageStatus == 2
                                ? BoxDecoration(
                                    color: handler.primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                        ),
                                      ])
                                : BoxDecoration(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '+ Create new',
                                style: TextStyle(
                                    color: handler.projectPageStatus == 2
                                        ? handler.textColor
                                        : handler.textColor2,
                                    fontFamily: handler.fontFamily),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              handler.projectPageStatus == 0 || handler.projectPageStatus == 1
                  ? ProjectsList()
                  : CreateNewProject()
            ],
          ),
        ),
      ),
    );
  }
}
