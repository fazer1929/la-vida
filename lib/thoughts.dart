import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sucide_app/config.dart';

class Thoughts extends StatefulWidget {
  @override
  _ThoughtsState createState() => _ThoughtsState();
}

class _ThoughtsState extends State<Thoughts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryPurple,
        body: Container(
          alignment: Alignment.center,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('thoughts').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text("Loading......");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return CarouselSlider(
                  options: CarouselOptions(height: 700, enlargeCenterPage: true,),
                  items: snapshot.data.docs.map<Widget>((DocumentSnapshot docu) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            decoration: BoxDecoration(
                                color: primaryPurple,
                                boxShadow: [mainBoxShadow],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              docu.data()['content'],
                              style: TextStyle(height:1.5,fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w500),
                            ));
                      },
                    );
                  }).toList(),
                );
                            
              }),
        ));
  }
}
