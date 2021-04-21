import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class AuthenticationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    final firebase = watch(firebaseVM);
    return Scaffold(
        backgroundColor: handler.backgroundColor,
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    handler.registerMode
                        ? Container(
                            width: 300,
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(color: handler.primaryColor),
                              controller: handler.nicknameController,
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
                                labelStyle:
                                    TextStyle(color: handler.primaryColor),
                                labelText: 'NickName',
                                hintText: 'BestUser23',
                                hintStyle:
                                    TextStyle(color: handler.secondaryColor),
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
                          )
                        : Container(),
                    Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: handler.primaryColor),
                        controller: handler.emailController,
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
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: handler.primaryColor),
                        controller: handler.passwordController,
                        cursorColor: handler.primaryColor,
                        validator: (String value) {
                          if (value.isEmpty || value == null) {
                            return 'Name is Required';
                          } else {
                            return '';
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
                    SizedBox(height: 50),
                    Container(
                        width: (handler.screenWidth * 0.9),
                        height: 50,
                        decoration: BoxDecoration(
                            color: handler.registerMode
                                ? handler.primaryColor
                                : handler.secondaryColor,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 2),
                              ),
                            ]),
                        child: FlatButton(
                          onPressed: () {
                            handler.registerMode
                                ? firebase.register(
                                    handler.emailController.text,
                                    handler.passwordController.text,
                                    handler.nicknameController.text)
                                : firebase.signIn(handler.emailController.text,
                                    handler.passwordController.text);
                            Navigator.of(context).pop();
                          },
                          child: handler.registerMode
                              ? Text('Sign up',
                                  style: TextStyle(
                                      color: handler.textColor,
                                      fontFamily: handler.fontFamily))
                              : Text('Log in',
                                  style: TextStyle(
                                      color: handler.textColor2,
                                      fontFamily: handler.fontFamily)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
