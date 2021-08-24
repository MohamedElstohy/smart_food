import 'dart:async';

import 'package:flutter/material.dart';

import '../helper.dart';
import 'login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      (){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) =>LoginScreen()
          )
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      body: SizedBox(
        width: Helper.getDeviceWidth(context),
        height: Helper.getDeviceHeight(context),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Splash – 1.png'),
              fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/Group 119.png',
              width: Helper.getDeviceWidth(context) / 3,
              height: Helper.getDeviceHeight(context) / 3,
              fit: BoxFit.cover,
            ),
          )
        ),
      ),
    );
  }
}