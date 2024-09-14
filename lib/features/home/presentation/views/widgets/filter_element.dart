import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';

class FilterElement extends StatelessWidget {
  final String image;
  final int index;

  FilterElement({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(kRadius24),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              width: 1,
              color: AppColors.white,
            ),
            borderRadius: BorderRadius.circular(kRadius24),
          ),
          child: Image.asset(
            image,
            height: 28.0.h,
            width: 56.0.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
