import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;

  final List<String> images = [
    'assets/images/launcher_icon.png',
    'assets/images/launcher_icon.png',
    'assets/images/launcher_icon.png',
  ];

  final List<String> texts = [
    'Exercise library',
    "Progress tracking",
    "Calorie and water tracking"
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
