import 'package:flutter/material.dart';
import 'package:sucide_app/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sucide_app/login/login.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
//        Navigator.of(context).pushReplacementNamed("start");
        debugPrint("no user");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }

  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushNamed(context, "/thoughts");
        },
        child: const Icon(Icons.arrow_right_alt_rounded,color: Colors.black38,size: 32,),
        backgroundColor:  primaryGreen,
      ),
      backgroundColor: primaryPurple,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child:                 Container(
                child: Text(
                  "${user?.email}",
                  style:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                color: secondaryPurple,
              ),
            ),
            ListTile(
              title: Text('Emergency'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Container(
              margin:EdgeInsets.symmetric(horizontal: 30),
              child:RaisedButton(
              
              padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
              
              onPressed: signOut,
              child: Text('Signout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              color: primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ), )
            ,
            ListTile(
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(maxWidth: 800),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Hello,  ${user?.displayName}",
                          style:
                          TextStyle(fontSize: 28, color: Colors.white)),
                      Text("Hope you are doing fine",
                          style:
                          TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://source.unsplash.com/50x50/?portrait',
                      )),
                ],
              ),
              containers(
                  "Stories", Alignment.bottomRight, 24, context, "stories"),
              containers(
                  "Articles", Alignment.bottomRight, 24, context, "articles"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containers("See Support Groups", Alignment.center, 18,
                      context, "stories"),
                  containers("Create A Support Group", Alignment.center, 18,
                      context, "stories")
                ],
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: secondaryPurple,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [mainBoxShadow]),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                alignment: Alignment.center,
                child: Text(
                  "Share Thoughts",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      )
    )
    ;
  }
}

Widget containers(
    String title, Alignment al, double fsize, BuildContext context, String rt) {
  return Expanded(
      child: GestureDetector(
    onTap: () => {Navigator.pushNamed(context, '/' + rt)},
    child: Container(
      decoration: BoxDecoration(
          color: secondaryPurple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [mainBoxShadow]),
      margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
      // color: secondaryPurple,
      padding: EdgeInsets.all(20),
      // decoration: BoxDecoration(),
      alignment: al,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fsize),
      ),
    ),
  ));
}
