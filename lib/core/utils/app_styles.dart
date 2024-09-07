import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';

abstract class AppStyles {
  static TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 26.sp,
    color: AppColors.black,
  );
  static TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: AppColors.black,
  );
  static TextStyle body1Regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.black,
  );
  static TextStyle body1Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.black,
  );
  static TextStyle body2Regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.black,
  );
  static TextStyle body2Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: AppColors.black,
  );
}
