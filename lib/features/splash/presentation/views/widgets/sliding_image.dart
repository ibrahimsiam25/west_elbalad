import 'package:flutter/material.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';


class SidingText extends StatelessWidget {
  const SidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
              position: slidingAnimation,
              child:  Text(
                "F O R   M O B I L E   S E R V I C E",style: AppStyles.title.copyWith(color: AppColors.primary),
              ));
        });
  }
}
