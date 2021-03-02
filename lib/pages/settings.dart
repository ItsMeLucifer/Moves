import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Settings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Settings',
            style: TextStyle(
                fontSize: 50,
                color: handler.textColor,
                fontFamily: handler.fontFamily,
                shadows: [handler.textShadow]),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
