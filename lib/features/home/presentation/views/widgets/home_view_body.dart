import 'package:flutter/material.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: AppStyles.header,
      ),
    );
  }
}
