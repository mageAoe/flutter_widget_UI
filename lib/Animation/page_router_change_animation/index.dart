import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 安卓风格 自定义 路由跳转 动画
class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({required WidgetBuilder builder, required this.page})
      : super(builder: builder);

  final Widget page;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

// ios 风格的左右滑动切换
// Navigator.push(context, CupertinoPageRoute(
//   builder: (context)=>PageB(),
// ));

// ios风格 自定义 路由跳转 动画
class CustomPageRouteCupertino extends CupertinoPageRoute {
  CustomPageRouteCupertino({required WidgetBuilder builder, required this.page})
      : super(builder: builder);

  final Widget page;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}



// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }