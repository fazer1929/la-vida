import 'package:flutter/material.dart';
import './dashboard.dart';
import './storiesAndArticles.dart';

void main() {
  runApp(MaterialApp(
    title: "LaVida",
    initialRoute: "/",
    routes: {
      "/": (context) => DashBoard(),
      "/stories":(context)=>StoriesAndArticles(),
    },
  ));
}
