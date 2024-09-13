import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_assets.dart';
import '../../../../../core/service/shared_preferences_singleton.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    _executeNavigation();
    super.initState();
  }

  void _executeNavigation() {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.splashBack,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: 120.0.w,
          child: FittedBox(
            child: Image.asset(
              AppAssets.logo,
            ),
          ),
        ),
      ),
    );
  }
}
