import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_colors.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_size.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_style.dart';

// 登录方式图标
class LoginTypeIconWidget extends StatelessWidget {
  const LoginTypeIconWidget({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        icon,
        width: 16,
        height: 16,
      ),
    );
  }
}

// 横线
class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 80,
      child: Divider(color: kTextColor),
    );
  }
}


// 登录按钮
class LoginBtnWidget extends StatelessWidget {
  const LoginBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kBtnShadow,
        borderRadius: BorderRadius.circular(kBtnRadius),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Login',
        style: kBtnTextStyle
      ),
    );
  }
}

// 渐变按钮组件
class GradientBtnWidget extends StatelessWidget {
  const GradientBtnWidget({
    super.key, 
    required this.child, 
    required this.width, 
    required this.onTap,
  });
  final double width;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          gradient: kBtnLinearGradient,
          boxShadow: kBtnShadow,
          borderRadius: BorderRadius.circular(kBtnRadius),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

// 白色按钮文字
class BtnTextWhiteWidget extends StatelessWidget {
  const BtnTextWhiteWidget({
    super.key, 
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kBtnTextStyle.copyWith( // 复用样式
        color: Colors.white
      ),
    );
  }
}

// 头部内容
class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('lib/images/beverage_recipe_application/images/bg_welcome_header.png'),
        const Positioned(
          top: 194,
          left: 40,
          child: Column(
            children: [
              AppIconWidget(),
              SizedBox(height: 8),
              Text('Sour', style: kTitleTextStyle,
              ),
              SizedBox(height: 8),
              Text('Best drink\nreceipes', style: kBodyTextStyle,
              )
            ],
          )
        )
      ],
    );
  }
}


// app icon
class AppIconWidget extends StatelessWidget {
  const AppIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIconBoxSize,
      height: kIconBoxSize,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: Image.asset(
        'lib/images/beverage_recipe_application/icons/app_icon.png',
        width: 24,
        height: 32,
      ),
    );
  }
}