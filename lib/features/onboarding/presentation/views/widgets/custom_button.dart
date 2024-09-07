import 'package:flutter/material.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import '../../../../../../core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onTap,
        color: AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius32),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.0.w, vertical: 8.0.h),
          child: Text(
            "التالي",
            style: AppStyles.title.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
