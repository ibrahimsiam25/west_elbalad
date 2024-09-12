import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/service/shared_preferences_singleton.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/phone_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
           
           child: ElevatedButton(onPressed: (){

            SharedPref.setBool(kIsSigninView, false);
            GoRouter.of(context).go(AppRouter.kSigninView);
           }, child: Text("تسجيل خروج"),),
            ),
            // Banner
            // Container(
            //   width: 360.0.w,
            //   height: 160.0.h,
            //   decoration: BoxDecoration(
            //     color: AppColors.red,
            //     borderRadius: BorderRadius.circular(
            //       kRadius24,
            //     ),
            //   ),
            //   child: Center(
            //     child: Text(
            //       'عروضنا مستمرة\nوالبيع بالتقسيط متاح.',
            //       textAlign: TextAlign.center,
            //       style: AppStyles.header.copyWith(
            //         color: AppColors.white,
            //         fontWeight: FontWeight.normal,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 12.0.h),
            // Text(
            //   'التليفونات المتوفرة',
            //   style: AppStyles.header,
            // ),
            // SizedBox(height: 12.0.h),
            // Wrap(
            //   spacing: 16.0,
            //   children: phones
            //       .map((phone) => PhoneItem(
            //             phone: phone,
            //           ))
            //       .toList(),
            // ),
          ],
        ),
      ),
    );
  }
}
