import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_ui/application/beverage_recipe_application/theme/app_size.dart';
import 'app_colors.dart';

// 按钮投影
const List<BoxShadow> kBtnShadow = [
  BoxShadow(
    color: kBtnShadowColor,
    offset: Offset(0, 8),
    blurRadius: 20
  )
];

// 标题文字样式
const TextStyle kTitleTextStyle = TextStyle(
  color: kTextColor,
  fontSize: kTitleTextSize,
  fontWeight: kMediumFontWeight
);

// 内容文字样式
const TextStyle kBodyTextStyle = TextStyle(
  color: kTextColor,
  fontSize: kBodyTextSize,
  fontWeight: kLightFontWeight
);

// 按钮文字样式
const TextStyle kBtnTextStyle = TextStyle(
  color: kBtnColorStart,
  fontSize: kBtnTextSize,
  fontWeight: kMediumFontWeight
); 

// 输入框边框
InputBorder kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kInputBorderRadius),
  borderSide: const BorderSide(
    width: 1,
    color: kInputBorderColor
  )
);