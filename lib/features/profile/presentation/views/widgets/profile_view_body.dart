import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/features/profile/presentation/views/widgets/image_picker_option.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImagePickerOptions(),
            SizedBox(height: 16.0.h),
            UserDataElement(
              text: 'ابراهيم فتحي ابراهيم ابراهيم',
              image: 'assets/images/user.png',
            ),
            SizedBox(height: 8.0.h),
            UserDataElement(
              text: 'ibrahim@ibrahim.ibrahim',
              image: 'assets/images/mail.png',
            ),
            SizedBox(height: 8.0.h),
            UserDataElement(
              text: '0123456789',
              image: 'assets/images/telephone.png',
            ),
            SizedBox(height: 8.0.h),
            UserDataElement(
              text: 'ابو حماد الدولة',
              image: 'assets/images/address.png',
            )
          ],
        ),
      ),
    );
  }
}

class UserDataElement extends StatelessWidget {
  final String text;
  final String image;

  const UserDataElement({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(kRadius16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Row(
          children: [
            Image.asset(
              width: 28,
              height: 28,
              image,
            ),
            SizedBox(width: 8.0.w),
            Text(
              text,
              style: AppStyles.subtitle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
