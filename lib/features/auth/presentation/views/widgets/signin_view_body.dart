import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0.h),
            Text(
              "انشاء حساب",
              style: AppStyles.header,
            ),
              SizedBox(height: 16.0.h),
            Lottie.asset(
              AppAssets.googleJson,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 80.0.h),
            SocialLoginButton(
              onPressed: () {
                context.read<SigninCubit>().signinWithGoogle();
              },
              image: AppAssets.googleIcon,
              title: 'تسجيل بواسطة جوجل',
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
