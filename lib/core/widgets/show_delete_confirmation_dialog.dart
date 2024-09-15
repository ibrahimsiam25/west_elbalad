import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
void showDeleteConfirmationDialog(
    BuildContext context, String title,VoidCallback onConfirm) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    borderSide: const BorderSide(color: Colors.red, width: 2),
    width: MediaQuery.of(context).size.width * 0.75,
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(12)),
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: 'تأكيد الحذف',
    desc: title,
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