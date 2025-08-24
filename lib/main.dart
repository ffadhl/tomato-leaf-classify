import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/app_theme_constant.dart';
import 'package:flutter_tomato_leaf_disease/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomato Leaf Disease Prediction',
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
