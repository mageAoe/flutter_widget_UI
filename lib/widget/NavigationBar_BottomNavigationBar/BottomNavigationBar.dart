import 'package:flutter/material.dart';
import './page_home.dart';
import './page_school.dart';
import './page_business.dart';

// 使用 BottomNavigationBar 制作导航

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
    _bottomNavPages..add(const HomePage())..add(const Business())..add(const SchoolPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页',backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '首页',backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '学院',backgroundColor: Colors.orange)
        ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          onTap:_onItemTapped
      ),
    );
  }
}
