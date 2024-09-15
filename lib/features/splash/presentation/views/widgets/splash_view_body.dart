import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import 'package:west_elbalad/core/constants/app_assets.dart';
import '../../../../../core/service/shared_preferences_singleton.dart';
import 'package:west_elbalad/features/splash/presentation/views/widgets/sliding_image.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
   late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  void executeNavigation() {
    bool isOnBoardingView = SharedPref.getBool(kIsOnBoardingView);
    bool isSigninView = SharedPref.getBool(kIsSigninView);
    Future.delayed(
      Duration(milliseconds: 4500),
      () {
        if (isOnBoardingView) {
          if (isSigninView) {
            GoRouter.of(context).go(AppRouter.kBottomNavBarController);
          } else {
            GoRouter.of(context).go(AppRouter.kSigninView);
          }
        } else {
          GoRouter.of(context).go(AppRouter.kOnBoardingView);
        }
      },
    );
  }
  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset(0,-1))
            .animate(animationController);
    animationController.forward();
  }
  @override
  void initState() {
    super.initState();
        initSlidingAnimation();
    executeNavigation();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
         mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
                SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: AspectRatio(
            aspectRatio: 800/ 318,
            child:Image.asset(AppAssets.spalsh),
          ),
        ),
          SidingText(slidingAnimation: slidingAnimation),
     
      ],
    );
  }
}
