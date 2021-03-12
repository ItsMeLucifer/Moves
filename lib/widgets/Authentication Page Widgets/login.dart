import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Login extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 70,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: handler.primaryColor),
              controller: handler.loginEmailController,
              cursorColor: handler.primaryColor,
              validator: (String value) {
                if (value.isEmpty || value == null) {
                  return 'Name is Required';
                }
              },
              onSaved: (String value) {
                handler.projectName = value;
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: handler.primaryColor),
                labelText: 'Email',
                hintText: 'myemail@example.com',
                hintStyle: TextStyle(color: handler.secondaryColor),
                icon: Icon(
                  Icons.contact_mail,
                  color: handler.primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: handler.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 70,
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: handler.primaryColor),
              controller: handler.loginPasswordController,
              cursorColor: handler.primaryColor,
              validator: (String value) {
                if (value.isEmpty || value == null) {
                  return 'Name is Required';
                }
              },
              onSaved: (String value) {
                handler.projectName = value;
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: handler.primaryColor),
                labelText: 'Password',
                hintText: '***************',
                hintStyle: TextStyle(color: handler.secondaryColor),
                icon: Icon(
                  Icons.contact_mail,
                  color: handler.primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: handler.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
