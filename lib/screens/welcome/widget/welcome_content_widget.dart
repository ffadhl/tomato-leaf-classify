import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/color_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/spacing_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/text_style_constant.dart';

class WelcomeScreenContent extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const WelcomeScreenContent({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          imagePath,
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyleConstant.poppinsSemiBold.copyWith(
            fontSize: 20,
            color: ColorConstant.primary500,
          ),
          textAlign: TextAlign.center,
        ),
        SpacingConstant.verticalSpacing150,
        Text(
          description,
          style: TextStyleConstant.poppinsRegular.copyWith(
            fontSize: 12,
            color: ColorConstant.neutral500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 75),
      ],
    );
  }
}