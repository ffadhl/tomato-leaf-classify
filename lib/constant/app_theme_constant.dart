import 'package:flutter/material.dart';
import 'color_constant.dart';
import 'text_style_constant.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: ColorConstant.neutral50,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstant.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyleConstant.poppinsBold.copyWith(
          fontSize: 24,
          color: ColorConstant.primary500,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorConstant.primary500,
      ),
    );
  }
}