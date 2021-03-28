import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);



final meetUpCategory = Category(
  categoryId: 1,
  name: "Meetup",
  icon: Icons.location_on,
);

final sportCategory = Category(
  categoryId: 2,
  name: "Sports",
  icon: Icons.golf_course,
);



final categories = [
  allCategory,
  meetUpCategory,
sportCategory,
];