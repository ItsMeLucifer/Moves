import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productivity/main.dart';
import 'package:productivity/pages/authentication_page.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        AuthenticationPage(),
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
            .animate(animation),
        child: child,
      );
    },
  );
}

class WelcomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    final String backgroundPicture = 'images/high-five.svg';
    handler.screenWidth = MediaQuery.of(context).size.width;
    final SvgParser parser = SvgParser();
    try {
      parser.parse(backgroundPicture);
      print('SVG is supported');
    } catch (e) {
      print('SVG contains unsupported features');
    }
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: handler.screenWidth,
              child: SvgPicture.asset(backgroundPicture,
                  width: handler.screenWidth),
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 180),
                      Text('Welcome to',
                          style: TextStyle(
                            fontSize: 35,
                            color: handler.textColor2,
                            fontFamily: handler.fontFamily,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('Moves',
                            style: TextStyle(
                              fontSize: 35,
                              color: handler.textColor3,
                              fontFamily: handler.fontFamily,
                            )),
                      ),
                      SizedBox(height: 130),
                      Container(
                          width: (handler.screenWidth * 0.9),
                          height: 50,
                          decoration: BoxDecoration(
                              color: handler.primaryColor,
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
                              handler.registerMode = true;
                              Navigator.of(context).push(_createRoute());
                            },
                            child: Text('Get started',
                                style: TextStyle(
                                    color: handler.textColor,
                                    fontFamily: handler.fontFamily)),
                          )),
                      SizedBox(height: 30),
                      Container(
                          width: (handler.screenWidth * 0.9),
                          height: 50,
                          decoration: BoxDecoration(
                              color: handler.secondaryColor,
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
                              handler.registerMode = false;
                              Navigator.of(context).push(_createRoute());
                            },
                            child: Text('Log in',
                                style: TextStyle(
                                    color: handler.textColor2,
                                    fontFamily: handler.fontFamily)),
                          )),
                      SizedBox(height: 22)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: handler.backgroundColor,
    );
  }
}
