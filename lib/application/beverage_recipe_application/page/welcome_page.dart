import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/page/login_page.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_colors.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/widget/welcome_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          const WelcomeHeaderWidget(),
          GradientBtnWidget(
            width: 208,
            child: const BtnTextWhiteWidget(text: 'Sign up'),
            onTap: (){},
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const LoginPage();
              }));
            },
            child: const LoginBtnWidget()
          ),
          const SizedBox(height: 16),
          const Text('Forgot password?',
            style: TextStyle(
              fontSize: 18,
              color: kTextColor,
            ),
          ),
          const SizedBox(height: 54),
          const Row(
            children: [
              Spacer(),
              LineWidget(),
              LoginTypeIconWidget(icon: 'lib/images/beverage_recipe_application/icons/logo_ins.png'),
              LoginTypeIconWidget(icon: 'lib/images/beverage_recipe_application/icons/logo_fb.png'),
              LoginTypeIconWidget(icon: 'lib/images/beverage_recipe_application/icons/logo_twitter.png'),
              LineWidget(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}

