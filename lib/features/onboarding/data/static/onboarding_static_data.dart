import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';

class AppColors {
  static const Color brightBlue = Color(0xFF0199FF);
  static const Color brightYellow = Color(0xFFFFCC00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color brightRed = Color(0xFFE9394E);
  static const Color brightPurple = Color(0xFF750CBE);
  static const Color black = Color(0xFF000000);
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: 'assets/images/onboarding1.json',
    title: 'احدث الهواتف بين يديك',
    subtitle: 'استمتع بتشكيلة واسعة من أحدث الهواتف الذكية بأفضل الأسعار.',
    backgroundColor: AppColors.brightYellow,
  ),
  OnboardingModel(
    image: 'assets/images/onboarding2.json',
    title: 'خدمات الصيانة الموثوقة',
    subtitle: 'نقدم لك خدمة تصليح محترفة لكل أنواع الهواتف بأسرع وقت.',
    backgroundColor: AppColors.brightBlue,
  ),
  OnboardingModel(
    image: 'assets/images/onboarding3.json',
    title: 'التقسيط أصبح أسهل',
    subtitle: 'امتلك هاتف أحلامك الآن وادفع على دفعات ميسرة دون أي تعقيدات.',
    backgroundColor: AppColors.brightRed,
  ),
  OnboardingModel(
    image: 'assets/images/onboarding4.json',
    title: 'عروض مميزة',
    subtitle: 'استفد من أفضل العروض والخصومات على الهواتف الذكية.',
    backgroundColor: AppColors.brightPurple,
  ),
];
