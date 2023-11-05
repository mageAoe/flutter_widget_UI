import 'package:flutter/material.dart';
import './page_home.dart';
import './page_school.dart';
import './page_business.dart';
import './page_search.dart';

// 使用 BottomAppBar 自定义导航

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
    _bottomNavPages..add(const HomePage())..add(const Business())..add(const SchoolPage())..add(const SearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.pink :Colors.white,
                ),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon:  Icon(
                  Icons.business,
                  color:  _selectedIndex == 1 ? Colors.pink :Colors.white,
                ),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon:  Icon(
                  Icons.school,
                  color:  _selectedIndex == 2 ? Colors.pink :Colors.white,
                ),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon:  Icon(
                  Icons.search,
                  color:  _selectedIndex == 3 ? Colors.pink :Colors.white,
                ),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          )
      )
    );
  }
}
