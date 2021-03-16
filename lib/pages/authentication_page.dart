import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:productivity/widgets/Authentication%20Page/login.dart';
import 'package:productivity/widgets/Authentication%20Page/register.dart';

class AuthenticationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    final firebase = watch(firebaseVM);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Moves',
              style: TextStyle(
                  fontSize: 40,
                  color: handler.textColor,
                  fontFamily: handler.fontFamily,
                  shadows: [handler.textShadow])),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Made to make moves',
                style: TextStyle(
                    fontSize: 25,
                    color: handler.textColor,
                    fontFamily: handler.fontFamily,
                    shadows: [handler.textShadow])),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: handler.secondaryColor,
                      border: Border.all(
                          color: !handler.registerMode
                              ? handler.primaryColor
                              : handler.greyedOutColor,
                          width: 5),
                      borderRadius: BorderRadius.circular(15)),
                  child: FlatButton(
                    onPressed: () {
                      handler.registerMode = false;
                    },
                    child: Text('Sign In',
                        style: TextStyle(
                            color: handler.textColor,
                            fontFamily: handler.fontFamily,
                            shadows: [handler.textShadow])),
                  )),
              SizedBox(
                width: 20,
              ),
              Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: handler.secondaryColor,
                      border: Border.all(
                          color: handler.registerMode
                              ? handler.primaryColor
                              : handler.greyedOutColor,
                          width: 5),
                      borderRadius: BorderRadius.circular(15)),
                  child: FlatButton(
                    onPressed: () {
                      handler.registerMode = true;
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: handler.textColor,
                            fontFamily: handler.fontFamily,
                            shadows: [handler.textShadow])),
                  )),
            ],
          ),
          !handler.registerMode ? Login() : Register(),
          SizedBox(height: 8),
          Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: handler.secondaryColor,
                  border: Border.all(color: handler.primaryColor, width: 5),
                  borderRadius: BorderRadius.circular(15)),
              child: FlatButton(
                onPressed: () {
                  handler.registerMode
                      ? firebase.register(
                          handler.registerEmailController.text,
                          handler.registerPasswordController.text,
                          handler.registerNicknameController.text)
                      : firebase.signIn(handler.loginEmailController.text,
                          handler.loginPasswordController.text);
                },
                child: Text(handler.registerMode ? 'Register' : 'Log in',
                    style: TextStyle(
                        color: handler.textColor,
                        fontFamily: handler.fontFamily,
                        shadows: [handler.textShadow])),
              )),
          SizedBox(height: 22)
        ],
      ),
      backgroundColor: handler.backgroundColor,
    );
  }
}
