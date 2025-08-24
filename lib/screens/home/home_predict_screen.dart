// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_leaf_disease/constant/color_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/spacing_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/string_value_constant.dart';
import 'package:flutter_tomato_leaf_disease/constant/text_style_constant.dart';
import 'package:flutter_tomato_leaf_disease/services/api_service.dart';
import 'package:flutter_tomato_leaf_disease/widgets/global_button_widget.dart';
import 'package:flutter_tomato_leaf_disease/widgets/global_loading_widget.dart';
import 'package:image_picker/image_picker.dart';

class HomePredictScreen extends StatefulWidget {
  const HomePredictScreen({super.key});

  @override
  State<HomePredictScreen> createState() => _HomePredictScreenState();
}

class _HomePredictScreenState extends State<HomePredictScreen> {
  File? _selectedImage;
  bool _isLoading = false;
  String _prediction = '';
  String _confidence = '';

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _prediction = '';
        _confidence = '';
      });
    }
  }

  Future<void> _predictDisease() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            StringValueConstant.ifNotAnyImage,
            style: TextStyleConstant.poppinsRegular.copyWith(
              color: ColorConstant.white,
              fontSize: 14.0,
            ),
          ),
          backgroundColor: ColorConstant.danger600,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await ApiService.predictDisease(_selectedImage!);

      setState(() {
        _prediction = response['prediction'];
        _confidence = '${response['confidence']}%';
        _isLoading = false;
      });
    } catch (e) {
      setState(
        () => _isLoading = false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
            style: TextStyleConstant.poppinsRegular.copyWith(
              color: ColorConstant.white,
              fontSize: 14.0,
            ),
          ),
          backgroundColor: ColorConstant.danger600,
        ),
      );
    }
  }

  Widget _buildImagePreview() {
    return Container(
      height: 400.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.neutral200,
        borderRadius: BorderRadius.circular(
          16,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.neutral300.withOpacity(
              0.2,
            ),
            blurRadius: 10.0,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: _selectedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera_back_outlined,
                  size: 40.0,
                  color: ColorConstant.primary500,
                ),
                SpacingConstant.verticalSpacing200,
                Text(
                  StringValueConstant.chooseImage,
                  style: TextStyleConstant.poppinsMedium.copyWith(
                    color: ColorConstant.neutral600,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildResultSection() {
    if (_prediction.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12.0,
          children: [
            Text(
              StringValueConstant.resultPrediction,
              style: TextStyleConstant.poppinsSemiBold.copyWith(
                fontSize: 18,
                color: ColorConstant.primary700,
              ),
            ),
            Text(
              _prediction,
              style: TextStyleConstant.poppinsMedium.copyWith(
                fontSize: 16,
                color: ColorConstant.neutral800,
              ),
            ),
            Text(
              '${StringValueConstant.accuracyLevel}$_confidence',
              style: TextStyleConstant.poppinsRegular.copyWith(
                color: ColorConstant.neutral600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringValueConstant.appBarTitle,
          style: TextStyleConstant.poppinsMedium.copyWith(
            fontSize: 20.0,
            color: ColorConstant.primary500,
          ),
        ),
        backgroundColor: ColorConstant.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          spacing: 24.0,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingConstant.verticalSpacing200,
                  Text(
                    StringValueConstant.greetings1,
                    style: TextStyleConstant.poppinsBold.copyWith(
                      fontSize: 28.0,
                      color: ColorConstant.primary500,
                    ),
                  ),
                  Text(
                    StringValueConstant.greetings2,
                    style: TextStyleConstant.poppinsRegular.copyWith(
                      fontSize: 14.0,
                      color: ColorConstant.neutral800,
                    ),
                  ),
                  SpacingConstant.verticalSpacing200,
                ],
              ),
            ),
            _buildImagePreview(),
            Row(
              spacing: 24.0,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlobalButtonWidget(
                  title: StringValueConstant.galleryButton,
                  onTap: () => _pickImage(
                    ImageSource.gallery,
                  ),
                  backgroundColor: ColorConstant.neutral200,
                  textColor: ColorConstant.neutral800,
                  width: 150.0,
                  height: 50.0,
                  isBorder: false,
                  fontSize: 16.0,
                  icon: Icons.photo_library_outlined,
                
                ),
                GlobalButtonWidget(
                  title: StringValueConstant.cameraButton,
                  onTap: () => _pickImage(ImageSource.camera),
                  backgroundColor: ColorConstant.primary500,
                  textColor: ColorConstant.white,
                  width: 150.0,
                  height: 50.0,
                  isBorder: false,
                  fontSize: 16.0,
                  icon: Icons.camera_alt_outlined,
                ),
              ],
            ),
            GlobalButtonWidget(
              title: StringValueConstant.predictButton,
              onTap: _predictDisease,
              backgroundColor: ColorConstant.primary500,
              textColor: ColorConstant.white,
              width: 150.0,
              height: 50.0,
              isBorder: false,
              fontSize: 16.0,
              icon: Icons.search,
            ),
            if (_isLoading) const MyLoading(),
            _buildResultSection(),
          ],
        ),
      ),
    );
  }
}
