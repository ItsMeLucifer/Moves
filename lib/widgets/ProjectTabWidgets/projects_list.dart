import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class ProjectsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    final firebaseServiceVM = watch(firebaseServiceViewModel);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    print("BUDUJE PROJECTS LIST");
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Container(
            width: handler.screenWidth * 0.9,
            decoration: BoxDecoration(
                color: handler.secondaryColor,
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                width: handler.screenWidth * 0.7,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      CupertinoIcons.search,
                    ),
                    hintText: 'Search for project name',
                    border: InputBorder.none,
                    //Need to change the color of focusColor somehow
                  ),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: handler.screenWidth * 0.8,
          child: StreamBuilder(
            stream: firebaseServiceVM.users.doc(firebaseServiceVM.auth.currentUser.uid).collection("projects").where("completed", isEqualTo: false).snapshots(),
            builder: (_, snapshot){
              if (snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                    itemBuilder: (_, index){
                    DocumentSnapshot document = snapshot.data.docs[index];
                    return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.startToEnd,
                        background: Container(
                          color: Colors.green,
                          child: Icon(CupertinoIcons.check_mark, color: Colors.white,),
                        ),
                        child: ListTile(
                          leading: Icon(CupertinoIcons.hourglass_bottomhalf_fill),
                          title: new Text(document.data()['name']),
                          subtitle: new Text(document.data()['description']),
                        ),
                      onDismissed: (direction){
                        firebaseServiceVM.users.doc(firebaseServiceVM.auth.currentUser.uid).collection("projects").doc(document.id).update({'completed': true});
                      },
                    );
                    }
                );
              }else{
                return CircularProgressIndicator();
              }
            },
          )
        ),
      ],
    );
  }
}
