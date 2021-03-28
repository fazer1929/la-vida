import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sucide_app/Story.dart';
import 'package:sucide_app/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoriesAndArticles extends StatefulWidget {
  StoriesAndArticles({Key key}) : super(key: key);

  @override
  _StoriesAndArticlesState createState() => _StoriesAndArticlesState();
}

class _StoriesAndArticlesState extends State<StoriesAndArticles> {
  @override
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addStories() {
    CollectionReference stories =
        FirebaseFirestore.instance.collection('stories');
    return stories.add({
      "text": "Hello How Are You",
      "user": FirebaseAuth.instance.currentUser
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            alignment: Alignment.center,
            child: Container(
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
                          color: secondaryPurple),
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Text(
                            "Stories",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('stories')
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Text("Loading......");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("Loading");
                              }
                              return ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: snapshot.data.docs
                                    .map<Widget>((DocumentSnapshot document) {
                                  print(document.reference.id);
                                  return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [mainBoxShadow],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border:
                                              Border.all(color: primaryPurple)),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                          onTap: () {
                                            print(document.id);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StoryView(id: document.reference.id),
                                              ),
                                            );
                                          },
                                          title: Text(
                                            document.data()['title'],
                                            textAlign: TextAlign.center,
                                          ),
                                          subtitle: Text("- Abhishek Agrawal",
                                              textAlign: TextAlign.center)));
                                }).toList(),
                              );
                            }),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
