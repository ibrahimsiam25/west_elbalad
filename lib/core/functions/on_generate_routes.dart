import '../../bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presention/views/sign_in_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/auth/presention/views/create_user_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      );
    case BottomNavBarController.routeName:
      return MaterialPageRoute(
        builder: (context) => const BottomNavBarController(),
      );
    case SignInView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignInView(),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
