import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:productivity/pages/charts.dart';
import 'package:productivity/pages/friends.dart';
import 'package:productivity/pages/productivity_assessment.dart';
import 'package:productivity/pages/projects.dart';
import 'package:productivity/pages/settings.dart';

class HomeScreen extends ConsumerWidget {
  @override
  List<Widget> pages = <Widget>[
    Charts(),
    Friends(),
    ProductivityAssessment(),
    Projects(),
    Settings()
  ];
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              icon: CupertinoIcons.chart_pie, extras: {'label': 'Home'}),
          FluidNavBarIcon(icon: CupertinoIcons.person_2),
          FluidNavBarIcon(icon: CupertinoIcons.add),
          FluidNavBarIcon(icon: CupertinoIcons.doc_on_doc),
          FluidNavBarIcon(
              icon: CupertinoIcons.settings, extras: {'label': 'Settings'})
        ],
        onChange: (index) {
          handler.actualPageIndex = index;
        },
        style: FluidNavBarStyle(
            barBackgroundColor: handler.primaryColor,
            iconSelectedForegroundColor: handler.primaryColor,
            iconBackgroundColor: Color.fromRGBO(1, 1, 1, 0),
            iconUnselectedForegroundColor: handler.backgroundColor),
      ),
      body: pages[handler.actualPageIndex],
      backgroundColor: handler.backgroundColor,
    );
  }
}
