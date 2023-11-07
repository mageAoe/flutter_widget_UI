import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/pages/cart_page.dart';
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
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage()
      },
    );
  }
}
