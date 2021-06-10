import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class CompletedProjectList extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    final firebaseServiceVM = watch(firebaseServiceViewModel);
    return  StreamBuilder(
      stream: firebaseServiceVM.users.doc(firebaseServiceVM.auth.currentUser.uid).collection("projects").where("completed", isEqualTo: true).snapshots(),
      builder: (_, snapshot){
        if (snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              itemBuilder: (_, index){
                DocumentSnapshot document = snapshot.data.docs[index];
                return ListTile(
                    leading: Icon(CupertinoIcons.check_mark, color: Colors.green,),
                    title: new Text(document.data()['name']),
                    subtitle: new Text(document.data()['description']),
                  );
              }
          );
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }

}