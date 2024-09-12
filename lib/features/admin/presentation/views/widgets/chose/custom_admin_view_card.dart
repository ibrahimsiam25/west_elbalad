import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/constants/app_colors.dart';
class CustomAdminViewCard extends StatelessWidget {
  const CustomAdminViewCard({
    super.key,
    required this.onPressed,
    required this.title,
  });
   final VoidCallback onPressed;

  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              color: AppColors.red,
     
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
                child: Text(
              title,
              style: AppStyles.title.copyWith(color: AppColors.white),
            ))));
  }
}

