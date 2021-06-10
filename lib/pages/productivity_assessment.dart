import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/ViewModels/FirebaseService.dart';
import 'package:productivity/main.dart';
import 'package:productivity/widgets/ProductivityTabWidgets/add_new_assessment.dart';
import 'package:productivity/widgets/ProductivityTabWidgets/update_assessment.dart';

class ProductivityAssessment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final firebase = watch(firebaseServiceViewModel);
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
