import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ProjectCreator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    final firebase = watch(firebaseVM);
    TextEditingController _nameController =
        TextEditingController(text: handler.projectName);
    TextEditingController _tagsController =
        TextEditingController(text: handler.projectTags);
    TextEditingController _descriptionController =
        TextEditingController(text: handler.projectDescription);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 30),
            child: Center(
              child: Text(
                'Project Creator',
                style: TextStyle(
                    fontFamily: handler.fontFamily,
                    fontSize: 30,
                    color: handler.textColor,
                    shadows: [handler.textShadow]),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 350,
            height: 80,
            child: TextFormField(
              key: handler.nameKey,
              controller: _nameController,
              cursorColor: handler.primaryColor,
              validator: (String value) {
                if (value.isEmpty || value == null) {
                  return 'Name is Required';
                }
              },
              onSaved: (String value) {
                handler.projectName = value;
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: handler.primaryColor),
                labelText: 'Project Name',
                hintText: 'My Awesome Project',
                hintStyle: TextStyle(color: handler.secondaryColor),
                icon: Icon(
                  Icons.contact_mail,
                  color: handler.primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: handler.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 80,
            child: TextFormField(
              controller: _tagsController,
              cursorColor: handler.primaryColor,
              style: TextStyle(color: handler.primaryColor),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: handler.primaryColor),
                labelText: 'Technologies/Tools',
                hintText: 'Photoshop, Flutter, Pencils',
                hintStyle: TextStyle(color: handler.secondaryColor),
                icon: Icon(
                  Icons.contact_mail,
                  color: handler.primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: handler.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 80,
            child: TextFormField(
              controller: _descriptionController,
              cursorColor: handler.primaryColor,
              style: TextStyle(color: handler.primaryColor),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: handler.primaryColor),
                labelText: 'Description',
                hintText: 'Blind people helping app!',
                hintStyle: TextStyle(color: handler.secondaryColor),
                icon: Icon(
                  Icons.contact_mail,
                  color: handler.primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: handler.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
            child: Text('Project progress: ',
                style: TextStyle(
                    fontSize: 17,
                    color: handler.primaryColor,
                    fontFamily: handler.fontFamily,
                    shadows: [handler.textShadow])),
          ),
          SfSliderTheme(
              data: SfSliderThemeData(
                activeTrackColor: handler.primaryColor,
                inactiveTrackColor: handler.secondaryColor,
                activeTrackHeight: 10.0,
                inactiveTrackHeight: 5.0,
                thumbColor: handler.primaryColor,
                thumbRadius: 10,
                tooltipBackgroundColor: handler.secondaryColor,
                tooltipTextStyle: TextStyle(
                    color: handler.primaryColor,
                    fontFamily: handler.fontFamily,
                    shadows: [handler.textShadow]),
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
                  enableTooltip: true,
                  showLabels: true,
                  showTicks: false,
                  showDivisors: false,
                  value: handler.projectProgress,
                  onChanged: (dynamic index) {
                    handler.projectProgress = index;
                  })),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                color: handler.secondaryColor,
                border: Border.all(color: handler.primaryColor, width: 5),
                borderRadius: BorderRadius.circular(15)),
            child: FlatButton(
                onPressed: () {
                  firebase.sendProject(
                      _nameController.text,
                      _tagsController.text,
                      _descriptionController.text,
                      handler.projectProgress);
                  handler.clearFields();
                  Navigator.pop(context);
                },
                child: Text('Save',
                    style: TextStyle(color: handler.primaryColor))),
          ),
        ],
      ),
      backgroundColor: handler.backgroundColor,
    );
  }
}
// final controller = PageController(
//       initialPage: 0,
//     );
// Stack(
//         children: [
//           PageView(controller: controller, children: [
//             ProjectName(),
//             ProjectDescription(),
//             ProjectProgress()
//           ]),
//           Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   child: SmoothPageIndicator(
//                       controller: controller,
//                       count: 3,
//                       effect: WormEffect(
//                         dotColor: handler.primaryColor,
//                         activeDotColor: handler.secondaryColor,
//                         dotHeight: 10,
//                         radius: 2.0,
//                         dotWidth: 20,
//                       )),
//                 ),
//               ))
//         ],
//       ),
