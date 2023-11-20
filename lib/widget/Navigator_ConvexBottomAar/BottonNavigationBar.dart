import 'package:flutter/material.dart';
import '../../testPage/page_home.dart';
import '../../testPage/page_school.dart';
import '../../testPage/page_search.dart';
import '../../testPage/page_business.dart';
import '../../testPage/page_action.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

// 使用 convex_bottom_bar: ^3.2.0 制作导航

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _bottomNavPages = []; // 底部导航栏各个可切换页面组

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavPages
      ..add(const HomePage())
      ..add(const Business())
      ..add(const ActionPage())
      ..add(const SchoolPage())
      ..add(const SearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[_selectedIndex],
      // bottomNavigationBar: ConvexAppBar(
      //     height: 55.0,
      //     backgroundColor: Colors.orange,
      //     gradient: const LinearGradient(colors: [Colors.blue,Colors.red]),
      //     activeColor: Colors.white70,
      //     items:const [
      //     TabItem(icon: Icons.home, title: 'Home'),
      //     TabItem(icon: Icons.map, title: 'Discovery'),
      //     TabItem(icon: Icons.add, title: 'Add'),
      //     TabItem(icon: Icons.message, title: 'Message'),
      //     TabItem(icon: Icons.people, title: 'Profile'),
      //   ],
      //   onTap: (int i) => _onItemTapped(i),
      // )
        bottomNavigationBar: ConvexAppBar.badge(
          badgeMargin: const EdgeInsets.fromLTRB(15, 0, 0, 25),
          const {3: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
          items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.map, title: 'Discovery'),
                TabItem(icon: Icons.add, title: 'Add'),
                TabItem(icon: Icons.message, title: 'Message'),
                TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => _onItemTapped(i),
        )
    );
  }
}

