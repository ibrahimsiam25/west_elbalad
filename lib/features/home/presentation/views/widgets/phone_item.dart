import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/features/home/data/model/phones_model.dart';

class PhoneItem extends StatelessWidget {
  final PhoneModel phone;
  const PhoneItem({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          kRadius16,
        ),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://th.bing.com/th/id/OIP.O-gRqcByJK1mGi5PGsL57AHaHa?rs=1&pid=ImgDetMain',
            width: 128.0.w,
            height: 128.0.h,
            placeholder: (context, url) => Skeletonizer(
              containersColor: AppColors.darkGrey,
              child: Container(
                width: 128.0.w,
                height: 128.0.h,
                color: AppColors.white,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            width: 128.0.w,
            child: Center(
              child: Text(
                phone.name,
                textAlign: TextAlign.center,
                style: AppStyles.title,
              ),
            ),
          ),
          SizedBox(
            width: 128.0.w,
            child: Center(
              child: Text(
                phone.description,
                textAlign: TextAlign.center,
                style: AppStyles.subtitle,
              ),
            ),
          ),
          Text(
            '${phone.price}\$',
            style: AppStyles.title.copyWith(
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
