import '../../bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';




abstract class AppRouter {
 static const kOnBoardingView = '/onBoardingView';
  static const kBottomNavBarController = '/bottomNavBarController';
  static const kSigninView = '/signinView';
  static const kSignupView = '/signupView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kBottomNavBarController,
        builder: (context, state) => const  BottomNavBarController(),
      ),
      GoRoute(
        path: kSigninView,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
    

    ],
  );
}