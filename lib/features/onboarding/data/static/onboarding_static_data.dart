import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';
import 'package:west_elbalad/core/constants/app_assets.dart';



List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: AppAssets.onboarding1,
    title: 'احدث الهواتف بين يديك',
    subtitle: 'استمتع بتشكيلة واسعة من أحدث الهواتف الذكية بأفضل الأسعار.',
    backgroundColor:  Color(0xFFFFCC00),
  ),
  OnboardingModel(
    image: AppAssets.onboarding2,
    title: 'خدمات الصيانة الموثوقة',
    subtitle: 'نقدم لك خدمة تصليح محترفة لكل أنواع الهواتف بأسرع وقت.',
    backgroundColor:Color(0xFF0199FF),
  ),
  OnboardingModel(
    image: AppAssets.onboarding3,
    title: 'التقسيط أصبح أسهل',
    subtitle: 'امتلك هاتف أحلامك الآن وادفع على دفعات ميسرة دون أي تعقيدات.',
    backgroundColor:Color(0xFFE9394E),
  ),
  OnboardingModel(
    image: AppAssets.onboarding4,
    title: 'عروض مميزة',
    subtitle: 'استفد من أفضل العروض والخصومات على الهواتف الذكية.',
    backgroundColor: Color(0xFF750CBE),
  ),
];
