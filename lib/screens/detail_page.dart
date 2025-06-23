import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';
import 'package:travelapp/widgets/app_buttons.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int starRating = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 240,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black.withOpacity(0.75),
                        ),
                        AppLargeText(
                          text: "\$250",
                          color: AppColor.mainColor.withOpacity(0.8),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColor.mainColor),
                        SizedBox(width: 5),
                        AppText(
                          text: "USA, California",
                          color: AppColor.textColor1,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < starRating
                                  ? AppColor.starColor
                                  : AppColor.textColor2,
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        AppText(text: "(4.0)", color: AppColor.textColor2),
                      ],
                    ),
                    SizedBox(height: 10),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColor.mainTextColor,
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 45,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColor.buttonBackground,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColor.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text:
                          "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.",
                      color: AppColor.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                child: Row(
                  children: [
                    AppButtons(
                      size: 50,
                      color: AppColor.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColor.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 10),
                    ResponsiveButton(isResponsive: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
