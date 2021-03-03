import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Friends extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Text(
          'Friends',
          style: TextStyle(
              fontSize: 30,
              fontFamily: handler.fontFamily,
              color: handler.textColor,
              shadows: [handler.textShadow]),
          textAlign: TextAlign.center,
        ))
      ],
    );
  }
}
