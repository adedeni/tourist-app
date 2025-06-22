import 'package:flutter/material.dart';
import 'package:travelapp/utilities/colors.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //this with TickerProviderStateMixin is to allow you to use the tabcontroller state
  var images = {
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    ); //it has to be here because it get rebuild at every click, and it needs a context
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 10),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicator: CircleIndicator(
                  color: AppColor.mainColor,
                  radius: 4,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Inspirations"),
                  Tab(text: "Emotions"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 180,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("images/mountain.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Text("There"),
                Text("Bye"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22),
                AppText(text: "See all", color: AppColor.textColor1),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                       // margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("images/"+images.keys.elementAt(index)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    Container(
                      height: 20,
                      child: AppText(text: images.values.elementAt(index), color: AppColor.textColor2,),
                    )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIndicator extends Decoration {
  final Color color;
  double radius;
  CircleIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint _paint = Paint()
      ..color = color
      ..isAntiAlias = true;

    final Offset circleOffset = Offset(
      offset.dx + configuration.size!.width / 2,
      offset.dy + configuration.size!.height - 1.5 * radius,
    );

    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
