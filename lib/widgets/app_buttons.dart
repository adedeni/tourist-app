import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;
   AppButtons({
    super.key, 
    this.text,
    this.icon,
    this.isIcon=false,
  required this.size,
  required this.color, 
  required this.backgroundColor, 
  required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              border: Border.all(color: borderColor, width: 1.0),
                              
                              borderRadius: BorderRadius.circular(15),
                              color: backgroundColor,
                            ),
                          );;
  }
}
