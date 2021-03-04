import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:productivity/widgets/project_creator.dart';

class Projects extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProjectCreator()));
              },
              child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: handler.secondaryColor,
                      border: Border.all(color: handler.primaryColor, width: 5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'Create new Project',
                      style: TextStyle(
                        color: handler.textColor,
                        fontFamily: handler.fontFamily,
                        fontSize: 20,
                        shadows: [handler.textShadow],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
