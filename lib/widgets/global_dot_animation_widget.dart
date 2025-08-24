import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/color_constant.dart';

class GlobalDotAnimationWidget extends StatelessWidget {
  final bool isActive;

  const GlobalDotAnimationWidget({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 4,
        width: isActive ? 25 : 4,
        decoration: BoxDecoration(
          color: isActive
              ? ColorConstant.primary500
              : ColorConstant.primary250,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}