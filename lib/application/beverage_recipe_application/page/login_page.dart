import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/widget/login_widget.dart';

// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('lib/images/beverage_recipe_application/images/bg_login_header.png'),
           Column(
            children: [
              const SizedBox(height: 320),
              ClipPath(
                clipper: LoginClipper(),
                child: const LoginBodyWidget()
              ),
            ],
          ),
          const Positioned(
            top: 64,
            left: 28,
            child: BackIcon(),
          )
        ],
      ),
    );
  }
}


class LoginClipper extends CustomClipper<Path> {
  // 第一个点
  Point<double> p1 = const Point(0.0, 54.0);
  Point<double> c1 = const Point(20.0, 25.0);
  Point<double> c2 = const Point(81.0, -8.0);
  // 第二个点
  Point<double> p2 = const Point(160.0, 20.0);
  Point<double> c3 = const Point(216.0, 38.0);
  Point<double> c4 = const Point(280.0, 73.0);
  // 第三个点
  Point<double> p3 = const Point(280.0, 44.0);
  Point<double> c5 = const Point(280.0, -11.0);
  Point<double> c6 = const Point(330.0, 8.0);

  @override
  Path getClip(Size size) {
    // 第四个点
    Point<double> p4 = Point(size.width, .0);

    Path path = Path();
    // 移动到第一个点
    path.moveTo(p1.x, p1.y);
    // 第一阶段 三阶贝塞尔曲线
    path.cubicTo(c1.x, c1.y, c2.x, c2.y, p2.x, p2.y);
    // 第二阶段 三阶贝塞尔曲线
    path.cubicTo(c3.x, c3.y, c4.x, c4.y, p3.x, p3.y);
    // 第三阶段 三阶贝塞尔曲线
    path.cubicTo(c5.x, c5.y, c6.x, c6.y, p4.x, p4.y);
    // 连接到第四个点
    // path.lineTo(p4.x, p4.y);
    // 连接到右下角
    path.lineTo(size.width, size.height);
    // 连接到左下角
    path.lineTo(0, size.height);
    // 闭合
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return hashCode != oldClipper.hashCode;
  }
}