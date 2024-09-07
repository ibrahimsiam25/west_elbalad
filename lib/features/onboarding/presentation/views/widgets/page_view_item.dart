import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../../../bottom_nav_bar.dart';
import '../../../../../../core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/features/onboarding/presentation/views/widgets/custom_button.dart';

class PageViewItem extends StatelessWidget {
  final PageController pageController;
  final bool isLastPage;
  final String image;
  final String title;
  final String subtitle;
  const PageViewItem({
    super.key,
    required this.image,
    required this.pageController,
    required this.isLastPage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Lottie.asset(
          width: 300.w,
          height: 300.h,
          image,
        ),
        SizedBox(height: 24.0.h),
        Text(
          title,
          style: AppStyles.title,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.0.h),
        SizedBox(
          width: 300.0.w,
          child: Text(
            subtitle,
            style: AppStyles.subtitle,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
        CustomButton(
          onTap: () {
            if (isLastPage) {
              Navigator.pushReplacementNamed(
                  context, BottomNavBarController.routeName);
            } else {
              // Move to the next page
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            }
          },
        ),
        SizedBox(height: 32.0.h),
      ],
    );
  }
}
