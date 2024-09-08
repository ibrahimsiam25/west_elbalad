import 'package:lottie/lottie.dart';
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
  late PageController _pageController;
  late double transitionPercent;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    transitionPercent = 0;
    _pageController = PageController(initialPage: 0);

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
            currentPageIndex += 1;
            if (currentPageIndex == onboardingList.length) {
              Navigator.pushReplacementNamed(
                  context, BottomNavBarController.routeName);
            } else {
              animationController?.reset();
              _pageController.animateToPage(
                currentPageIndex,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          });
        }
      });
  }

  @override
  void dispose() {
    animationController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int nextPageIndex = (currentPageIndex + 1) % onboardingList.length;
    final int nextToNextPageIndex =
        (currentPageIndex + 2) % onboardingList.length;

    final double maxOffset = 300;
    double offsetPercent = transitionPercent <= 0.25
        ? transitionPercent / 0.25
        : (transitionPercent >= 0.7
            ? Curves.easeInCubic.transform((1.0 - transitionPercent) / 0.3)
            : 1.0);
    final double contentOffset = offsetPercent * maxOffset;
    final double contentScale = 0.6 + (0.4 * (1.0 - offsetPercent).abs());

    return
       Stack(
        children: [
        
          Positioned.fill(
            child: CustomPaint(
              painter: CircleTransitionPainter(
                backgroundColor: onboardingList[currentPageIndex].backgroundColor,
                currentCircleColor: onboardingList[nextPageIndex].backgroundColor,
                nextCircleColor:
                    onboardingList[nextToNextPageIndex].backgroundColor,
                transitionPercent: transitionPercent,
              ), child:  PageView.builder(
          
            controller: _pageController,
            itemCount: onboardingList.length,
           physics: const NeverScrollableScrollPhysics(),

            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1),
                  SizedBox(
                    width: 240.0,
                    child: Lottie.asset(
                      onboardingList[index].image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    onboardingList[index].title,
                    style: TextStyle(
                      fontSize: 24,
                      color: onboardingList[index].textColor,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: 300.0,
                    child: Center(
                      child: Text(
                        onboardingList[index].subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: onboardingList[index].textColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              );
            },
          ) ,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.3,
            bottom: MediaQuery.of(context).size.height * 0.18,
            child: GestureDetector(
              onTap: () {
                controllWithAnimation(context);
              },
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.13,
              ),
            ),
          ),
        ],
      );
  }

  void controllWithAnimation(BuildContext context, {bool forward = true}) {
        if (currentPageIndex == onboardingList.length - 1) {
      Navigator.pushReplacementNamed(
          context, BottomNavBarController.routeName);
    } else if(forward) {
      animationController!.forward();
    } else{
      animationController!.reverse();
    }
  }
}
