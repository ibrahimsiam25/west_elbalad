import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:west_elbalad/features/onboarding/data/static/onboarding_static_data.dart';
import 'package:west_elbalad/features/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:west_elbalad/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();

    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      controller: controller.pageController,
      itemBuilder: (context, index) {
        return PageViewItem(
          image: onboardingList[index].lottie,
          title: onboardingList[index].title,
          subtitle: onboardingList[index].subtitle,
          pageController: controller.pageController,
          isLastPage: index == 2,
        );
      },
    );
  }
}
