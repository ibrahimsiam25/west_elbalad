import 'package:flutter/material.dart';
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
            if (currentPageIndex == pages.length) {
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
    final int nextPageIndex = (currentPageIndex + 1) % pages.length;
    final int nextToNextPageIndex = (currentPageIndex + 2) % pages.length;

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
      child: CustomPaint(
        painter: CircleTransitionPainter(
          backgroundColor: pages[currentPageIndex].backgroundColor,
          currentCircleColor: pages[nextPageIndex].backgroundColor,
          nextCircleColor: pages[nextToNextPageIndex].backgroundColor,
          transitionPercent: transitionPercent,
        ),
        child: Transform(
          transform: Matrix4.translationValues(contentOffset, 0, 0)
            ..scale(contentScale),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    width: 200,
                    pages[currentPageIndex].image,
                  ),
                  const SizedBox(height: 50),
                  Text(pages[currentPageIndex].title),
                  const SizedBox(height: 50),
                  Text(pages[currentPageIndex].description),
                  const SizedBox(height: 200),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.47,
                left: MediaQuery.of(context).size.width / 7,
                child: GestureDetector(
                  onTap: () {
                    if (currentPageIndex == 2) {
                      // If the user is on the third page, navigate to BottomNavBarController
                      Navigator.pushReplacementNamed(
                          context, BottomNavBarController.routeName);
                    } else {
                      // Otherwise, continue the animation to the next page
                      animationController!.forward();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 6,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
