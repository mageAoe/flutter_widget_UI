import 'package:flutter/material.dart';
import './animated_bottom_bar.dart';
import './BarItem.dart';
import './BarStyle.dart';

import '../page_home.dart';
import '../page_school.dart';
import '../page_business.dart';
import '../page_search.dart';

class BottomBarNavigationPatternExample extends StatefulWidget {

  const BottomBarNavigationPatternExample({super.key});

  @override
  State<BottomBarNavigationPatternExample> createState() => _BottomBarNavigationPatternExampleState();
}

class _BottomBarNavigationPatternExampleState extends State<BottomBarNavigationPatternExample> {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Business",
      iconData: Icons.favorite_border,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: "Profile",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
  ];

  int selectedBarIndex = 0;

  final List<Widget> _bottomNavPages = []; // 底部导航栏各个可切换页面组

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavPages
      ..add(const HomePage(color: Colors.indigo))
      ..add(const Business(color: Colors.pinkAccent))
      ..add(SchoolPage(color: Colors.yellow.shade900))
      ..add(const SearchPage(color: Colors.teal));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: AnimatedContainer(
      //   color: barItems[selectedBarIndex].color,
      //   duration: const Duration(milliseconds: 500),
      // ),
      body: _bottomNavPages[selectedBarIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          animationDuration: const Duration(milliseconds: 300),
          barStyle: BarStyle(
              fontSize: 20.0,
              iconSize: 30.0
          ),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          }),
    );
  }
}
