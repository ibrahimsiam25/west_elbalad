import '../../bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onBoardingView';
  static const kBottomNavBarController = '/bottomNavBarController';
  static const kSigninView = '/signinView';
  static const kSignupView = '/signupView';
  static const kVerificationView = '/verificationView';
  static const kWrapper = '/wrapper';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/cs",
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
        path: "/",
        builder: (context, state) => const SigninView(),
      ),
     GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
          GoRoute(
        path: kWrapper,
        builder: (context, state) => const Wrapper(),
      ),
   GoRoute(
        path: kVerificationView,
        builder: (context, state) => const VerificationView(),
      ),
    ],
  );
}