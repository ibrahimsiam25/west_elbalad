import 'package:west_elbalad/core/constants/app_colors.dart';

import '../model/onboarding_model.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: 'assets/images/onboarding1.json',
    title: 'احدث الهواتف بين يديك',
    subtitle: 'استمتع بتشكيلة واسعة من أحدث الهواتف الذكية بأفضل الأسعار.',
    backgroundColor: AppColors.lightGrey,
    textColor: AppColors.black,
  ),
  OnboardingModel(
    image: 'assets/images/onboarding2.json',
    title: 'خدمات الصيانة الموثوقة',
    subtitle: 'نقدم لك خدمة تصليح محترفة لكل أنواع الهواتف بأسرع وقت.',
    backgroundColor: AppColors.darkGrey,
    textColor: AppColors.white,
  ),
  OnboardingModel(
    image: 'assets/images/onboarding3.json',
    title: 'التقسيط أصبح أسهل',
    subtitle: 'امتلك هاتف أحلامك الآن وادفع على دفعات ميسرة دون أي تعقيدات.',
    backgroundColor: AppColors.black,
    textColor: AppColors.white,
  ),
];
