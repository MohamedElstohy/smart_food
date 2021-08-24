import 'package:flutter/foundation.dart';
import 'package:smart_food/models/restaurant.dart';

class Category{
  String name;
  int id;

  Category({
    @required this.id,
    @required this.name
  });

  Category.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}