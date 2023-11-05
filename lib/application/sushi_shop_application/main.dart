import 'package:flutter/material.dart';
import './pages/intro_page.dart';
import './pages/menu_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
      routes: {
        '/intropage': (context)=> const IntroPage(),
        '/menupage': (context) => const MenuPage()
      },
    );
  }
}
