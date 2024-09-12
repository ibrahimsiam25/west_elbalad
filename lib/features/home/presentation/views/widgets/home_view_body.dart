import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/phone_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16.0.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'تصفح الأجهزة المتاحة',
                    style: AppStyles.title,
                  ),
                ),
                SizedBox(height: 16.0.h),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          kRadius24,
                        ),
                      ),
                      child: Image.asset(
                        height: 48.0.h,
                        'assets/phones/itel_logo.png',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0.h),
                Wrap(
                  spacing: 16.0,
                  children: phones
                      .map((phone) => PhoneItem(
                            phone: phone,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
