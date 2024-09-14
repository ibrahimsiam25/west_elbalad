import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/constants/app_consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/widgets/custom_button.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';



class EditInStoreViewBody extends StatelessWidget {
  const EditInStoreViewBody({super.key, required this.phonesList});
  final List phonesList ;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizontalPadding, vertical: 8.0.h),
            itemCount: phonesList.length,
            itemBuilder: (context, index) {
              final phone = phonesList[index];
              return PhoneDataElement(phoneEntites: phone);
            },
          );
    
  }
}

class PhoneDataElement extends StatelessWidget {
  const PhoneDataElement({super.key, required this.phoneEntites});
   final PhoneEntites phoneEntites;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0.h),
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius24),
        color: AppColors.white,

      ),
      child: Column(
        children: [
          Text("اسم الشركة: ${phoneEntites.name}",style: AppStyles.semiBold16,),
          SizedBox(height: 8.0.h),
          Text("نوع الهاتف: ${phoneEntites.type}",style: AppStyles.semiBold16,),
          SizedBox(height: 8.0.h),
          Text("السعر: ${phoneEntites.price}",style: AppStyles.semiBold16,),
          SizedBox(height: 8.0.h),
          Text("الوصف: ${phoneEntites.description}",style: AppStyles.semiBold16,),
          SizedBox(height: 8.0.h),
          Row(
            children: [
              CustomButton(onPressed: () {}, text: "تعديل"),
              CustomButton(onPressed: () {}, text: "حذف"),
            ],
          )        
        ],
      ),
    ) ;
  }
}