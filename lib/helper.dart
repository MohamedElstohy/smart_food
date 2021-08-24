import 'package:flutter/material.dart';
import 'package:smart_food/utilities/strings.dart';

class Helper{
  static double getDeviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double getDeviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static int getCategoryIndeex({@required List<bool> elements}){
    int counter = 0;
    int index = -1;

    for(int i = 0 ; i < elements.length ; i++){
      if(elements[i]){
        counter++;
        index = i;
      } 
    }
    
    return (counter <= 1) ? index : Exception();
  }

  static Map<String , dynamic> getBody({@required String phone , @required String password}){
    return {
      "mobile" : phone,
      "password" : password,
      "access_key" : ACCESS_KEY,
      "access_password" : ACCESS_PASSWORD
    };
  }
}