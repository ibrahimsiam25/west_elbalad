import 'package:flutter/material.dart';
import '../../../../../bottom_nav_bar.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_consts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/service/shared_preferences_singleton.dart';
import '../../../../onboarding/presentation/views/onboarding_view.dart';

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
    Future.delayed(
      Duration(milliseconds: 4500),
      () {
        if (isOnBoardingView) {
          Navigator.pushReplacementNamed(
              context, BottomNavBarController.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnboardingView.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            width: 224.0.w,
            'assets/images/logo.png',
          ),
          SizedBox(height: 32.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                padding: EdgeInsets.zero,
                width: 180.0.w,
                animation: true,
                lineHeight: 3.0,
                animationDuration: 3000,
                percent: 1,
                barRadius: const Radius.circular(10),
                progressColor: AppColors.red,
                backgroundColor: AppColors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
