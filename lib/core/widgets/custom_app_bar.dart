import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
       GoRouter.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.semiBold16,
    ),
  );
}
