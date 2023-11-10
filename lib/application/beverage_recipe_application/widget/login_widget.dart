import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_size.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_style.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/widget/welcome_widget.dart';


class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.white,
      width: double.maxFinite,
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 86),
          Text('Login',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 20),
          Text('Your Email',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Email',
            prefixIcon: 'lib/images/beverage_recipe_application/icons/icon_email.png',
          ),
          SizedBox(height: 16),
          Text('Your Password',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Password',
            prefixIcon: 'lib/images/beverage_recipe_application/icons/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(height: 32),
          LoginBtnIconWdiget(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

// 登录按钮
class LoginBtnIconWdiget extends StatelessWidget {
  const LoginBtnIconWdiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GradientBtnWidget(
          width: 160,
          child: Row(
            children: [
              const SizedBox(width: 34),
              const BtnTextWhiteWidget(text: 'Login'),
              const Spacer(),
              Image.asset(
                'lib/images/beverage_recipe_application/icons/icon_arrow_right.png',
                width: kIconSize,
                height: kIconSize,
              ),
              const SizedBox(width: 24),
            ],
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

// 输入框
class LoginInput extends StatelessWidget {
  const LoginInput({
    super.key, 
    required this.hintText,
    required this.prefixIcon, 
    this.obscureText = false,
  });

  final String hintText;
  final String prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: kInputBorder,
        focusedBorder: kInputBorder,
        enabledBorder: kInputBorder,
        prefixIcon: Container(
          width: kIconBoxSize,
          height: kIconBoxSize,
          alignment: Alignment.center,
          child: Image.asset(
            prefixIcon,
            width: kIconSize,
            height: kIconSize,
          ),
        ),
      ),
      obscureText: obscureText,
      style: kBodyTextStyle.copyWith(
        fontSize: 18
      ),
    );
  }
}

// 返回
class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: kIconBoxSize,
        height: kIconBoxSize,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        child: Image.asset(
          'lib/images/beverage_recipe_application/icons/icon_back.png',
          width: kIconSize,
          height: kIconSize,
        ),
      ),
    );
  }
}