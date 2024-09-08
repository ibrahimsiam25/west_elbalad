import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import '../../../../../bottom_nav_bar.dart';
import '../../../data/static/onboarding_static_data.dart';
import 'package:west_elbalad/features/onboarding/presentation/views/widgets/circle_transition_painter.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  _OnBoardingViewBodyState createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late double transitionPercent;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    transitionPercent = 0;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )
      ..addListener(() {
        setState(() {
          transitionPercent = animationController!.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            // Increment the page index when animation completes
            currentPageIndex += 1;

            // If the current page is the last one, navigate to BottomNavBarController
            if (currentPageIndex == onboardingList.length) {
              Navigator.pushReplacementNamed(
                  context, BottomNavBarController.routeName);
            } else {
              animationController?.reset();
            }
          });
        }
      });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int nextPageIndex = (currentPageIndex + 1) % onboardingList.length;
    final int nextToNextPageIndex =
        (currentPageIndex + 2) % onboardingList.length;

    // Calculate offsets and scaling for the transition animation
    final double maxOffset = 300;
    double offsetPercent = transitionPercent <= 0.25
        ? transitionPercent / 0.25
        : (transitionPercent >= 0.7
            ? Curves.easeInCubic.transform((1.0 - transitionPercent) / 0.3)
            : 1.0);
    final double contentOffset = offsetPercent * maxOffset;
    final double contentScale = 0.6 + (0.4 * (1.0 - offsetPercent).abs());

    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (currentPageIndex == 2) {
              // If the user is on the third page, navigate to BottomNavBarController
              Navigator.pushReplacementNamed(
                context,
                BottomNavBarController.routeName,
              );
            } else {
              // Otherwise, continue the animation to the next page
              animationController!.forward();
            }
          });
        },
        child: CustomPaint(
          painter: CircleTransitionPainter(
            backgroundColor: onboardingList[currentPageIndex].backgroundColor,
            currentCircleColor: onboardingList[nextPageIndex].backgroundColor,
            nextCircleColor:
                onboardingList[nextToNextPageIndex].backgroundColor,
            transitionPercent: transitionPercent,
          ),
          child: Transform(
            transform: Matrix4.translationValues(contentOffset, 0, 0)
              ..scale(contentScale),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                SizedBox(
                  width: 240.0.w,
                  child: Lottie.asset(
                    width: 240.0.w,
                    fit: BoxFit.fitWidth,
                    onboardingList[currentPageIndex].image,
                  ),
                ),
                SizedBox(height: 32.0.h),
                Text(
                  onboardingList[currentPageIndex].title,
                  style: AppStyles.title.copyWith(
                    color: onboardingList[currentPageIndex].textColor,
                  ),
                ),
                SizedBox(height: 16.0.h),
                SizedBox(
                  width: 300.0.w,
                  child: Center(
                    child: Text(
                      onboardingList[currentPageIndex].subtitle,
                      textAlign: TextAlign.center,
                      style: AppStyles.subtitle.copyWith(
                        color: onboardingList[currentPageIndex].textColor,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
