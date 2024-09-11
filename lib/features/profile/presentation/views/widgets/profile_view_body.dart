import 'package:flutter/material.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/widgets/custom_text_field.dart';
import 'package:west_elbalad/features/profile/presentation/views/widgets/image_picker_option.dart';
import 'package:west_elbalad/features/profile/presentation/views/widgets/select_governorate.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePickerOptions(),
                SizedBox(height: 16.0.h),
                //Name
                CustomTextFormField(
                  initialValue: 'ابراهيم فتحي ابراهيم ابراهيم',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 8.0.h),
                //Email
                CustomTextFormField(
                  initialValue: 'ibrahimfathi@gmail.com',
                  prefixIcon: Icon(
                    Icons.mail,
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 8.0.h),
                //Phone
                CustomTextFormField(
                  initialValue: '01015757898',
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 8.0.h),
                //Governorate
                SelectGover(),
                SizedBox(height: 8.0.h),
                //Address
                CustomTextFormField(
                  initialValue: 'العنوان',
                  prefixIcon: Icon(
                    Icons.location_city,
                  ),
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 16.0.h),
              ],
            ),
          ),
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
