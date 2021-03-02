import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ProductivityAssessment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    final firebase = watch(firebaseVM);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Text(
            'How was your productivity today?',
            style: TextStyle(
                color: handler.textColor,
                fontSize: 30,
                fontFamily: handler.fontFamily,
                shadows: [handler.textShadow]),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 30),
          child: Text(
            '${handler.productivityLevel.toInt()}%',
            style: TextStyle(
                color: handler.textColor,
                fontSize: 50,
                fontFamily: handler.fontFamily,
                shadows: [handler.textShadow]),
            textAlign: TextAlign.center,
          ),
        ),
        SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackColor: handler.primaryColor,
              inactiveTrackColor: handler.secondaryColor,
              activeTrackHeight: 10.0,
              inactiveTrackHeight: 5.0,
              thumbColor: Color.fromRGBO(127, 85, 125, 1),
              thumbRadius: 20,
              activeLabelStyle: TextStyle(
                  color: handler.textColor,
                  fontSize: 12,
                  fontFamily: handler.fontFamily,
                  shadows: [handler.textShadow]),
              inactiveLabelStyle: TextStyle(
                  color: handler.textColor,
                  fontSize: 12,
                  fontFamily: handler.fontFamily,
                  shadows: [handler.textShadow]),
            ),
            child: SfSlider(
                min: 0.0,
                max: 100.0,
                interval: 100,
                thumbIcon: Center(
                  child: Text(
                    handler.emoji[handler.productivityLevel ~/ 10],
                    style: TextStyle(fontSize: 35),
                    textAlign: TextAlign.center,
                  ),
                ),
                showLabels: true,
                showTicks: false,
                showDivisors: false,
                value: handler.productivityLevel,
                onChanged: (dynamic index) {
                  handler.productivityLevel = index;
                })),
        Padding(
          padding: const EdgeInsets.only(top: 130.0),
          child: GestureDetector(
            onTap: () {
              firebase.sendProductivityData(
                  handler.productivityLevel.toInt(), new DateTime.now());
            },
            child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: handler.primaryColor, width: 4),
                    borderRadius: BorderRadius.circular(50),
                    color: handler.secondaryColor),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: handler.textColor,
                        fontFamily: handler.fontFamily,
                        fontSize: 25,
                        shadows: [handler.textShadow]),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
