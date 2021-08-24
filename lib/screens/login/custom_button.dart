import 'package:flutter/material.dart';

import '../../helper.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;

  CustomButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Helper.getDeviceWidth(context)/3,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFAEC632),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        elevation: 5.0,        
        color: Color(0xFFAEC632),
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          height: 30.0,
          onPressed: onPressed,
          child: Text(
            'دخول',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 22,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}