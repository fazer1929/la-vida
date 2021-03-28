import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sucide_app/Models/Stories.dart';
import 'package:sucide_app/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class StoryView extends StatefulWidget {
//   @override
//   _StoryViewState createState() => _StoryViewState();
//   StoryView({Key key, @required id}) : super(key: key);
// }

// class _StoryViewState extends State<StoryView> {
//   Story story;
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference stories =
//         FirebaseFirestore.instance.collection('stories');
//     stories.doc("GMz4Yrr15PnH5BPCZ9sv").get().then((DocumentSnapshot docu) {
//     });
// return
//   ));
// }
// }

class StoryView extends StatelessWidget {
  final String id;
  StoryView({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference story =
        FirebaseFirestore.instance.collection('stories');

    return FutureBuilder<DocumentSnapshot>(
      future: story.doc("GMz4Yrr15PnH5BPCZ9sv").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Scaffold(
            body: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: primaryBlue),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data.data()['title'],
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " - Abhishek Agrawal",
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                        child: Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 450,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [mainBoxShadow],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border:Border.all(color: primaryPurple)                        
                        ),
                        child: Text(snapshot.data.data()['content'],textAlign: TextAlign.justify,style: TextStyle(
                          fontSize: 22,
                          wordSpacing: 1.2,
                          color: primaryGrey,
                          letterSpacing: 1.2
                        ),),
                      ),
                    ))
 )
                                      ]),
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}
