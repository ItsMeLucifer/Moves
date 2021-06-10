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
            'Last Month',
            style: TextStyle(
              fontSize: 30,
              color: handler.textColor3,
              fontFamily: handler.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Center(
        )
      ],
    );
  }
}
