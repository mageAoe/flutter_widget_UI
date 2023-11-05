import 'package:flutter/material.dart';
import './bottom_bar_navigation_pattern/bottom_bar_navigation_pattern_example.dart';

// 自定义组件导航

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomBarNavigationPatternExample(),
    );
  }
}
