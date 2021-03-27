import 'package:flutter/material.dart';
import 'package:sucide_app/config.dart';

class StoriesAndArticles extends StatefulWidget {
  StoriesAndArticles({Key key}) : super(key: key);

  @override
  _StoriesAndArticlesState createState() => _StoriesAndArticlesState();
}

class _StoriesAndArticlesState extends State<StoriesAndArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: primaryPurple),
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
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [mainBoxShadow],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: primaryPurple)

                      ),
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        
                          title: Text(index.toString(),textAlign: TextAlign.center,),
                          subtitle: Text("- Abhishek Agrawal",textAlign: TextAlign.center))
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
