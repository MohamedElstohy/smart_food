import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utilities/strings.dart';

class Auth with ChangeNotifier{
  Dio dio = new Dio();
  LoggedUser _user;
  
  
  Future< LoggedUser> login({@required Map<String , dynamic> body}) async {
    var response = await dio.post(
      LOGIN_URL,
      data: body,
      options: Options(
        headers: {
          "Content-Type" : "application/json"
        }
      )
    );
    

    if(response.statusCode == 200){
      try{
        _user = LoggedUser.fromJson(response.data['return']);
        
        print(response.data['return']);
        return _user;
      } catch(e){
        return LoggedUser(age: -1,gender: '-1',id: -1,password: '-1', mobile: '-1');
        // throw e;
      }
    } else{
      return LoggedUser(age: -1,gender: '-1',id: -1,password: '-1', mobile: '-1');
    } 
  }

}