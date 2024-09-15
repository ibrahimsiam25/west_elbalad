import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/constants/app_consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import '../../../manager/remove_from_store/remove_from_store_cubit.dart';
import '../../../../../../core/widgets/show_delete_confirmation_dialog.dart';
import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';



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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "نوع الهاتف:   ${phoneEntites.name}",
              style: AppStyles.semiBold16,
            ),
          ),
          SizedBox(height: 8.0.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "اسم الشركة:    ${phoneEntites.type}",
              style: AppStyles.semiBold16,
            ),
          ),
          SizedBox(height: 8.0.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "السعر:   ${phoneEntites.price}",
              style: AppStyles.semiBold16,
            ),
          ),
          SizedBox(height: 8.0.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الوصف:   ${phoneEntites.description}",
              style: AppStyles.semiBold16,
            ),
          ),
          SizedBox(height: 20.0.h),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize:
                    Size(MediaQuery.of(context).size.width * 0.3, 40.h),
                backgroundColor: AppColors.red,
              ),
              onPressed: () {
                showDeleteConfirmationDialog(context, 'هل أنت متأكد من حذف ${phoneEntites.name}  ${phoneEntites.type} ؟',() {
               BlocProvider.of<RemoveFromStoreCubit>(context)
              .deletePhoneData(phoneEntites.id);
                    
                });
              },
              child: Text(
                "حذف",
                style: AppStyles.semiBold16.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

