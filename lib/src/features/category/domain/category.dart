import 'package:flutter/widgets.dart';

class Category {
  String id;
  String name;
  IconData? icon;

  Category({
    required this.id,
    required this.name,
    this.icon,
  });
}
