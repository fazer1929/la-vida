import 'package:flutter/material.dart';
//import 'package:sucide_app/Login.dart';
import './dashboard.dart';
import 'package:sucide_app/login/login.dart';

void main() {
  runApp(MaterialApp(
    title: "LaVida",
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
//      "/stories":(context)=>StoriesAndArticles(),
    },
  ));
}