import 'package:flutter/material.dart';
import 'package:west_elbalad/features/onboarding/data/onboarding_static_data.dart';
import 'package:west_elbalad/features/onboarding/presentation/views/widgets/page_view_item.dart';



class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  _OnBoardingViewBodyState createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      itemCount: 3,
      controller: pageController,
      itemBuilder: (context, index) {
        return PageViewItem(
          image: onboardingList[index].lottie,
          title: onboardingList[index].title,
          subtitle: onboardingList[index].subtitle,
          pageController: pageController,
          isLastPage: index == 2,
        );
      },
    );
  }
}
