import 'package:flutter/material.dart';
//import 'package:sucide_app/Login.dart';
import './dashboard.dart';

import './storiesAndArticles.dart';

import 'package:sucide_app/login/login.dart';
import 'ui/homepage/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "LaVida",
    initialRoute: "/login",
    routes: {

      "/": (context) => DashBoard(),
      "/stories":(context)=>StoriesAndArticles(),
      "/login": (context) => Login(),
      "/event": (context) => HomePage(),
//      "/stories":(context)=>StoriesAndArticles(),

    },
  ));
}