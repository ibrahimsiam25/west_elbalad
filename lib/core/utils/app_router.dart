import 'package:get/get.dart';
import 'package:west_elbalad/bottom_nav_bar.dart';
import '../../features/auth/presention/views/sign_in_view.dart';
import '../../features/auth/presention/views/create_user_view.dart';
import 'package:west_elbalad/features/home/presentation/views/home_view.dart';
import 'package:west_elbalad/features/splash/presentation/views/splash_view.dart';
import 'package:west_elbalad/features/onboarding/presentation/views/onboarding_view.dart';

// import 'package:get/get.dart';


abstract class AppRouter {
  static const String kSplashView = '/splashView';
  static const String kOnBoardingView = '/onBoardingView';
  static const String kHomeView = '/homeView';
  static const String kBottomNavBarController = '/bottomNavBarController';
  static const String signInView = '/signInView';
  static const String signUpView = '/signUpView';

  static final routes = [
    GetPage(
      name: kSplashView,
      page: () => const SplashView(),
    ),
       GetPage(
      name: signUpView,
      page: () => const SignUpView(),
    ),
      GetPage(
      name: signInView,
      page: () => const SignInView(),
    ),
    GetPage(
      name: kOnBoardingView,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: kHomeView,
      page: () => const HomeView(),
    ),
    GetPage(
      name: kBottomNavBarController,
      page: () => const BottomNavBarController(),
    ),
  ];
}
