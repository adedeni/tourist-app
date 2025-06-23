import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';
import 'package:travelapp/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.isResponsive = false, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.mainColor,
        ),

        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppText(text: "Book Trip Now", color: Colors.white),
                  )
                : Container(),
            isResponsive == true
                ? Container(
                  padding: EdgeInsets.only(right: 3),
                  child: Image.asset("images/button.png", fit: BoxFit.cover))
                : Image.asset("images/button.png", fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
