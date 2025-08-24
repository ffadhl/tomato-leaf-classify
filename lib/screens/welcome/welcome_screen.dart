import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/color_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/image_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/string_value_constant.dart';
import 'package:flutter_tomato_leaf_disease/model/welcome_model.dart';
import 'package:flutter_tomato_leaf_disease/screens/home/home_predict_screen.dart';
import 'package:flutter_tomato_leaf_disease/screens/welcome/widget/welcome_content_widget.dart';
import 'package:flutter_tomato_leaf_disease/widgets/global_dot_animation_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<WelcomeOnBoard> _onBoard = [
    WelcomeOnBoard(
      title: StringValueConstant.welcomeTitle1,
      description: StringValueConstant.welcomeMessage1,
      imagePath: ImageConstant.imageWelcome1,

    ),
    WelcomeOnBoard(
      title: StringValueConstant.welcomeTitle2,
      description: StringValueConstant.welcomeMessage2,
      imagePath: ImageConstant.imageWelcome2,
    ),
    WelcomeOnBoard(
      title: StringValueConstant.welcomeTitle3,
      description: StringValueConstant.welcomeMessage3,
      imagePath: ImageConstant.imageWelcome3,
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: _onBoard.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) => WelcomeScreenContent(
                        title: _onBoard[index].title,
                        description: _onBoard[index].description,
                        imagePath: _onBoard[index].imagePath,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        _onBoard.length,
                        (index) => GlobalDotAnimationWidget(
                          isActive: index == _currentPage,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 60.0,
                        width: 60.0,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (_currentPage == _onBoard.length - 1) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePredictScreen(),
                                ),
                              );
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          backgroundColor: ColorConstant.primary500,
                          shape: const CircleBorder(),
                          child: Icon(
                            Icons.arrow_forward,
                            color: ColorConstant.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Positioned(
              top: 16,
              right: 24,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePredictScreen(),
                    ),
                  );
                },
                child: Text(
                  "Lewati",
                  style: TextStyle(
                    color: ColorConstant.primary500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
