import 'package:flutter/material.dart';

// import './widget/AnimatedBottomBar/BottomNavigationBar.dart';
// import './Animation/lottie_start_animation/index.dart';
// import 'application/beverage_recipe_application/main.dart';


// void main() {
//   runApp(const MyApp());
// }


// 上面的导入使用上面main函数启动
// 下面这个比较特殊
import 'package:provider/provider.dart';
import './application/sushi_shop_application/main.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/shop.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    )
  );
}
