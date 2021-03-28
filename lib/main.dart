import 'package:flutter/material.dart';
import 'package:sucide_app/articles.dart';
import 'package:sucide_app/thoughts.dart';
import './dashboard.dart';
import './storiesAndArticles.dart';

void main() {
  runApp(MaterialApp(
    title: "LaVida",
    initialRoute: "/",
    routes: {
      "/": (context) => DashBoard(),
      "/stories":(context)=>StoriesAndArticles(),
      "/articels":(context)=>Articles(),
      "/thoughts":(context)=>Thoughts(),
    },
  ));
}
