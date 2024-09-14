import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/constants/app_consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
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
              "اسم الشركة:   ${phoneEntites.name}",
              style: AppStyles.semiBold16,
            ),
          ),
          SizedBox(height: 8.0.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "نوع الهاتف:   ${phoneEntites.type}",
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
          Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.3, 40.h),
                  backgroundColor: AppColors.red,
                ),
                onPressed: () {
                  // Edit functionality here
                },
                child: Text(
                  "تعديل",
                  style: AppStyles.semiBold16.copyWith(color: AppColors.white),
                ),
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.3, 40.h),
                  backgroundColor: AppColors.red,
                ),
                onPressed: () {
                  showDeleteConfirmationDialog(context, () {

                  });
                },
                child: Text(
                  "حذف",
                  style: AppStyles.semiBold16.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showDeleteConfirmationDialog(
    BuildContext context, VoidCallback onConfirm) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    borderSide: const BorderSide(color: Colors.red, width: 2),
    width: MediaQuery.of(context).size.width * 0.75,
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(12)),
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: 'تأكيد الحذف',
    desc: 'هل أنت متأكد من حذف؟',
    btnCancelText: 'رجوع',
    btnOkText: 'نعم',
    btnCancelOnPress: () {
      // Cancel action (close the dialog)
    },
    btnOkOnPress: () {
      // Confirm action
      onConfirm();
    },
  ).show();
}
