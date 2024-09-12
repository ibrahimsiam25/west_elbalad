import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/data/static/phones_static_data.dart';
import 'package:west_elbalad/features/home/presentation/views/widgets/phone_item.dart';

class SelectedPhones extends StatelessWidget {
  const SelectedPhones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
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
    );
  }
}
