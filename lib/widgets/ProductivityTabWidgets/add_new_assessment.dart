import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:jiffy/jiffy.dart';

import '../../main.dart';

class AddNewAssessment extends StatefulWidget{
  @override
  _AddNewAssessment createState() => _AddNewAssessment();
}

class _AddNewAssessment extends State<AddNewAssessment> {
  @override
  void initState() {
    context.read(appHandlerViewModel).fetchTodayProductivityFromDatabase();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child){
        final firebase = watch(firebaseServiceViewModel);
        final handler = watch(appHandlerViewModel);
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Hello Patrick,',
                style: TextStyle(
                  color: handler.textColor2,
                  fontSize: 30,
                  fontFamily: handler.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'How was your productivity today?',
                style: TextStyle(
                  color: handler.textColor3,
                  fontSize: 25,
                  fontFamily: handler.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: handler.screenWidth * 0.5,
                height: handler.screenWidth * 0.5,
                decoration: BoxDecoration(
                    color: handler.secondaryColor,
                    borderRadius: BorderRadius.circular(handler.screenWidth * 0.25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${handler.productivityLevel.toInt()}%',
                    style: TextStyle(
                      color: handler.textColor2,
                      fontSize: 50,
                      fontFamily: handler.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: handler.screenWidth * 0.9,
                child: SfSliderTheme(
                    data: SfSliderThemeData(
                      activeTrackColor: handler.primaryColor,
                      inactiveTrackColor: handler.tertiaryColor,
                      activeTrackHeight: 10.0,
                      inactiveTrackHeight: 7.0,
                      thumbColor: handler.backgroundColor,
                      thumbRadius: 15,
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
                        showLabels: false,
                        showTicks: false,
                        showDivisors: false,
                        value: handler.productivityLevel,
                        onChanged: (dynamic index) {
                          handler.productivityLevel = index;
                        })),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: () {
                    firebase.sendProductivityData(handler.productivityLevel.toInt(),
                        Jiffy(new DateTime.now()).format("dd.MM.y"));
                  },
                  child: Container(
                      width: handler.screenWidth * 0.6,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: handler.primaryColor),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: handler.textColor,
                            fontFamily: handler.fontFamily,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

/*
* Text(
                '${handler.productivityLevel.toInt()}%',
                style: TextStyle(
                  color: handler.textColor2,
                  fontSize: 50,
                  fontFamily: handler.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),*/