import 'package:flutter/material.dart';
import 'package:sucide_app/config.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryPurple,
     body: Container(
       margin:EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Column(
              children: [
                Text("Hello, Kuldeep!",style: TextStyle(fontSize:28,color: Colors.white)),
                Text("Hope you are doing fine",style: TextStyle(fontSize:18,color: Colors.white)),
              ],
               

            
            ), CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://source.unsplash.com/50x50/?portrait',
          )),],
          ),
          containers("Stories", Alignment.bottomRight,24),containers("Articles", Alignment.bottomRight,24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              containers("See Support Groups", Alignment.center,18),containers("Create A Support Group", Alignment.center,18)
            ],
          ),
           Container(
        height: 50,
       decoration:BoxDecoration(
          color: secondaryPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [mainBoxShadow]
        ),
        margin: EdgeInsets.symmetric(vertical: 15.0),
    alignment: Alignment.center,
    child: Text("Share Thoughts",style: TextStyle(color: Colors.white,fontSize: 18),),
  )
        ],
      ),
    ), 
    ) 
    ;
  }
}

Widget containers(String title,Alignment al,double fsize) {
  return Expanded(child:Container(
        decoration:BoxDecoration(
          color: secondaryPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [mainBoxShadow]
        ),
        margin: EdgeInsets.symmetric(vertical: 35.0,horizontal: 20),
      // color: secondaryPurple,
      padding: EdgeInsets.all(20),
      // decoration: BoxDecoration(), 
    alignment: al,
    child: Text(title,style: TextStyle(color: Colors.white,fontSize: fsize),),
  ) )
   ;
}
