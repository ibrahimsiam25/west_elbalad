import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:west_elbalad/features/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:west_elbalad/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();

    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.images.length,
      controller: controller.pageController,
      itemBuilder: (context, index) {
        return PageViewItem(
          image: controller.images[index],
          text: controller.texts[index],
          pageController: controller.pageController,
          isLastPage: index == controller.images.length - 1,
        );
      },
    );
  }
}
