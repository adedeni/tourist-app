import 'package:flutter/material.dart';
import 'package:travelapp/screens/navigation/bar_item.dart';
import 'package:travelapp/screens/home_page.dart';
import 'package:travelapp/screens/navigation/my_page.dart';
import 'package:travelapp/screens/navigation/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItem(),
    SearchPage(),
    MyPage()
  ];

  int tappedIndex=0;
  void onTap (index) {
    setState(() {
      tappedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[tappedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: tappedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "My", icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
