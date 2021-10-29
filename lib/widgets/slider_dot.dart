import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  final bool isActive;
  SliderDot(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: 10),
      width: isActive?12:5,
      height: 5,
      duration: Duration(milliseconds: 150),
      decoration: BoxDecoration(
          color: isActive? Colors.white: Colors.white54, borderRadius: BorderRadius.circular(5)),
    );
  }
}
