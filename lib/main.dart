import 'package:flutter/material.dart';

//import 'package:sucide_app/Login.dart';

import 'package:sucide_app/articles.dart';
import 'package:sucide_app/thoughts.dart';

import './dashboard.dart';

import './storiesAndArticles.dart';

import 'package:sucide_app/login/login.dart';
import 'ui/homepage/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "LaVida",
    initialRoute: "/login",
    routes: {

      "/": (context) => DashBoard(),
      "/stories":(context)=>StoriesAndArticles(),

      "/login": (context) => Login(),
      "/event": (context) => HomePage(),
//      "/stories":(context)=>StoriesAndArticles(),


      "/articels":(context)=>Articles(),
      "/thoughts":(context)=>Thoughts(),

    },
  ));
}