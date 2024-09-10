import 'package:svg_flutter/svg.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/constants/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  final String image;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color:AppColors.black, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
