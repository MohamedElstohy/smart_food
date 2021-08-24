import 'package:flutter/material.dart';

import '../../helper.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isSelected;

  FilterButton({
    @required this.title,
    @required this.onPressed,
    @required this.isSelected
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: Helper.getDeviceWidth(context)/4,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: !isSelected ? Color(0xFFFFFFFF) : Color(0xFFEF2823),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color(0xFFEF2823),
          width: 1.1
        )
      ),
      child: Material(
        elevation: 5.0,        
        color: !isSelected ? Colors.white : Color(0xFFEF2823),
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          height: 30.0,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: !isSelected ? Color(0xFFEF2823) : Color(0xFFFFFFFF),
              fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}
