import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/features/splash/presentation/manger/splash_controller.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
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
