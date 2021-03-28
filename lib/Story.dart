import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sucide_app/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryView extends StatelessWidget {
  // Declare a field that holds the Todo.
  final String id;

  // In the constructor, require a Todo.
  StoryView({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
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
                  ),],),)
    );
  }
}
