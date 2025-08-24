import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/color_constant.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: CircularProgressIndicator(
        color: ColorConstant.primary500,
        strokeWidth: 1.5,
        backgroundColor: ColorConstant.neutral200,
      ),
    );
  }
}