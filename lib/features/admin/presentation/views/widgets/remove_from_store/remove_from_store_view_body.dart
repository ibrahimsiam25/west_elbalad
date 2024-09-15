import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/widgets/custom_app_bar.dart';
import 'package:west_elbalad/features/admin/presentation/views/widgets/remove_from_store/phone_data_element.dart';




class RemoveFromStoreViewBody extends StatelessWidget {
  const RemoveFromStoreViewBody({super.key, required this.phonesList});
  final List phonesList ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAppBar(title:  "الحذف من المتجر",),
        SizedBox(height: 5.0.h),
        Expanded(
          child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding, vertical: 8.0.h),
                  itemCount: phonesList.length,
                  itemBuilder: (context, index) {
                    final phone = phonesList[index];
                    return PhoneDataElement(phoneEntites: phone);
                  },
                ),
        ),
      ],
    );
    
  }
}

