import 'package:flutter/material.dart';
import 'package:ui_color_picker_web/screen/about.dart';
import 'package:ui_color_picker_web/screen/gradients_page.dart';
import 'package:ui_color_picker_web/screen/home_page.dart';
import 'package:ui_color_picker_web/screen/simple_color.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "UI Color Picker",
            style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w900,
                shadows: [
                  Shadow(color: Colors.grey),
                  Shadow(
                    color: Colors.white,
                    blurRadius: 0.4,
                  )
                ],
                fontSize: 20,
                letterSpacing: 3.5),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.lime,
            tabs: [
              Tab(
                child: Text(
                  isPortrait ? "Colors" : "Plain Colors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.75,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  isPortrait ? "Gradient" : "Gradient Color",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.75,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  isPortrait ? "Light" : "Light Color",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.75,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  isPortrait ? "About" : "About Us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.75,
                  ),
                ),
              ),
            ],
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          bottomOpacity: 1,
        ),
        body: TabBarView(
          children: [
            SimpleColor(),
            GradientsPage(),
            HomePage(),
            About(),
          ],
          controller: _tabController,
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.04,
          child: Center(
            child: Text("With great color, comes great design."),
          ),
        ));
  }
}
