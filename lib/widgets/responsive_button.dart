import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.isResponsive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.mainColor
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/button.png", fit: BoxFit.cover,),
          
        ],
      ),

      );
  }
}
