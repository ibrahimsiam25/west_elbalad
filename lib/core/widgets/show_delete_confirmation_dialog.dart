import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';

void showDeleteConfirmationDialog(
  BuildContext context,
  String title,
  VoidCallback onConfirm,
) {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: AppColors.white,
    dialogType: DialogType.warning,
    width: MediaQuery.of(context).size.width * 0.90,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(8.0.r)),
    padding: EdgeInsets.all(8.0.h),
    headerAnimationLoop: true,
    title: 'تأكيد الحذف',
    titleTextStyle: AppStyles.title,
    desc: title,
    descTextStyle: AppStyles.semiBold16.copyWith(
      color: AppColors.red,
    ),
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
