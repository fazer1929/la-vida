import 'package:flutter/material.dart';
import './dashboard.dart';

void main() {
  runApp(MaterialApp(
    title: "LaVida",
    initialRoute: "/",
    routes: {
      "/": (context) => DashBoard(),
    },
  ));
}
