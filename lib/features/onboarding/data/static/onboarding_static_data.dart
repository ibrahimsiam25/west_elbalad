import '../model/onboarding_model.dart';
import '../../../../core/constants/app_assets.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';

final List<Page> pages = [
  Page(
      image: AppAssets.logo,
      title: 'First Page',
      description: 'This is the first page',
      backgroundColor: AppColors.black),
  Page(
      image: AppAssets.logo,
      title: 'Second Page',
      description: 'This is the second page',
      backgroundColor: AppColors.darkBlue),
  Page(
      image: AppAssets.logo,
      title: 'Third Page',
      description: 'This is the third page',
      backgroundColor: AppColors.red),
];


// List<OnboardingModel> onboardingList = [
//   OnboardingModel(
//     lottie: 'assets/images/onboarding2.json',
//     title: 'احدث الهواتف بين يديك',
//     subtitle: 'استمتع بتشكيلة واسعة من أحدث الهواتف الذكية بأفضل الأسعار.',
//   ),
//   OnboardingModel(
//     lottie: 'assets/images/onboarding2.json',
//     title: 'خدمات الصيانة الموثوقة',
//     subtitle: 'نقدم لك خدمة تصليح محترفة لكل أنواع الهواتف بأسرع وقت.',
//   ),
//   OnboardingModel(
//     lottie: 'assets/images/onboarding2.json',
//     title: 'التقسيط أصبح أسهل',
//     subtitle: 'امتلك هاتف أحلامك الآن وادفع على دفعات ميسرة دون أي تعقيدات.',
//   ),
// ];
