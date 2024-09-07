import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:west_elbalad/core/constants/app_assets.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/features/splash/presentation/manger/splash_controller.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogo(),
        const SizedBox(height: 36.0),
        _buildProgressIndicator(context),
      ],
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SvgPicture.asset(
        AppAssets.logo,
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.2986,
      ),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width * 0.4026,
        animation: true,
        lineHeight: 3.0,
        animationDuration: 2000,
        percent: 1,
        barRadius: const Radius.circular(10),
        progressColor: AppColors.blue,
        backgroundColor: AppColors.grey,
      ),
    );
  }
}
