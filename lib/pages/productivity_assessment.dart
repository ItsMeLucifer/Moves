import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:productivity/view%20model/firebase.dart';
import 'package:productivity/widgets/Productivity%20Assessment%20Page/add_new_assessment.dart';
import 'package:productivity/widgets/Productivity%20Assessment%20Page/update_assessment.dart';
import 'package:jiffy/jiffy.dart';

class ProductivityAssessment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //final handler = watch(appHandler);
    final firebase = watch(firebaseVM);
    // firebase.doesProductivityDataExists(
    //     Jiffy(new DateTime.now()).format("dd.MM.y"));
    switch (firebase.documentExists) {
      case ProductivityDataInfo.Existing:
        return UpdateAssessment();
        break;
      case ProductivityDataInfo.Nonexistent:
        return AddNewAssessment();
        break;
      case ProductivityDataInfo.Unspecified:
        return Center(child: CircularProgressIndicator());
        break;
    }
  }
}
