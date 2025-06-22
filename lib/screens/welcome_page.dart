import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'backgroundimage1.png',
    'backgroundimage2.png',
    'backgroundimage3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length, //number of pages you want to slide
        itemBuilder: (_, index) {
          //_ means you are using a default context
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 30),
                      SizedBox(height: 20),
                      Container(
                        width: 220,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance",
                          color: AppColor.textColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40),
                      ResponsiveButton(width: 120),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (index){
                      return Container(
                        width: 8,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.mainColor
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
