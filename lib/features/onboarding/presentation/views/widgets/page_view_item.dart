import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Lottie.asset(
          width: 300.w,
          height: 300.h,
          image,
        ),
        SizedBox(height: 32.0.h),
        Text(
          title,
          style: AppStyles.header1,
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: AppStyles.body1Regular,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {
            if (isLastPage) {
              Get.offAllNamed(AppRouter.kHomeView);
            } else {
              // Move to the next page
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          child: Text('data'),
          // child: SvgPicture.asset(
          //   AppAssets.arrowIcon,
          // ),
        ),
        SizedBox(height: 46.0.h),
      ],
    );
  }
}
