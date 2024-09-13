import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title, VoidCallback? onRefresh}) {
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
    actions: onRefresh != null
        ? [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: onRefresh,
            ),
          ]
        : [],
  );
}