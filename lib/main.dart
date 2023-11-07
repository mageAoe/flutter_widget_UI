import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/shop.dart';
import 'package:provider/provider.dart';
// import './widget/AnimatedBottomBar/BottomNavigationBar.dart';
// import './Animation/lottie_start_animation/index.dart';
import './application/sushi_shop_application/main.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    )
  );
}
