import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/text_style_constant.dart';

class GlobalButtonWidget extends StatelessWidget {
  final Function() onTap;
  final double width;
  final double height;
  final Color backgroundColor;
  final bool isBorder;
  final Color? borderColor;
  final String title;
  final Color textColor;
  final double fontSize;
  final IconData? icon;

  const GlobalButtonWidget({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.isBorder,
    this.borderColor,
    required this.title,
    required this.textColor,
    required this.fontSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: isBorder
              ? Border.all(
                  color: borderColor ?? backgroundColor,
                  width: 1.0,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 20,
                color: textColor,
              ),
            if (icon != null)
              const SizedBox(
                width: 8,
              ),
            Text(
              title,
              style: TextStyleConstant.poppinsMedium.copyWith(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
