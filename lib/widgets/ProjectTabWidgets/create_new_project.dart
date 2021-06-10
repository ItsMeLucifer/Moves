import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';

class CreateNewProject extends ConsumerWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    final firebaseServiceVM = watch(firebaseServiceViewModel);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        width: handler.screenWidth * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: handler.screenWidth * 0.8,
              child: Text(
                'Project Name',
                style: TextStyle(
                  color: handler.textColor3,
                  fontSize: 15,
                  fontFamily: handler.fontFamily,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: handler.screenWidth * 0.85,
              height: 40,
              decoration: BoxDecoration(
                  color: handler.secondaryColor,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: 'Type project name...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 15)),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: handler.screenWidth * 0.8,
              child: Text(
                'Description',
                style: TextStyle(
                  color: handler.textColor3,
                  fontSize: 15,
                  fontFamily: handler.fontFamily,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: handler.screenWidth * 0.85,
              height: 40,
              decoration: BoxDecoration(
                  color: handler.secondaryColor,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                      hintText: '...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 15)),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                firebaseServiceVM.createNewProject(nameController.text, descriptionController.text, false);
                handler.projectPageStatus = 0;
              },
              child: Container(
                width: handler.screenWidth * 0.45,
                decoration: BoxDecoration(
                    color: handler.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: handler.textColor,
                        fontSize: 15,
                        fontFamily: handler.fontFamily),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
