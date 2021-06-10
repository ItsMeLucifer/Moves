import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Charts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Charts',
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
