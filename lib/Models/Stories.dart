import 'package:firebase_auth/firebase_auth.dart';

class Story {
  String title, content;
  User user;
  DateTime dateCreated;
  Story(String title, String content, User user) {
    this.title = title;
    this.content = content;
    this.user = user;
    this.dateCreated = DateTime.now();
  }

  String getTitle() {
    return this.title;
  }
  
  String getContent() {
    return this.content;
  }
}
