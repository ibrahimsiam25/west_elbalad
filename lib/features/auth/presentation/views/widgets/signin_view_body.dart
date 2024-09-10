import 'dart:io';
import 'package:flutter/material.dart';
import 'dont_have_account_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/widgets/custom_button.dart';
import 'package:west_elbalad/core/widgets/password_field.dart';
import 'package:west_elbalad/core/widgets/custom_text_field.dart';
import 'package:west_elbalad/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:west_elbalad/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:west_elbalad/features/auth/presentation/views/widgets/social_login_button.dart';



class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text("تسجيل دخول", style: AppStyles.header),
                   const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'نسيت كلمة المرور؟',
                      style: AppStyles.semiBold16.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 33,
                ),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
      
                      context.read<SigninCubit>().signin(email, password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'تسجيل دخول',
                ),
                const SizedBox(
                  height: 33,
                ),
                const DontHaveAnAccountWidget(),
                const SizedBox(
                  height: 33,
                ),
                const OrDivider(),
                const SizedBox(
                  height: 16,
                ),
                SocialLoginButton(
                  onPressed: () {
                    context.read<SigninCubit>().signinWithGoogle();
                  },
                  image: AppAssets.googleIcon,
                  title: 'تسجيل بواسطة جوجل',
                ),
                const SizedBox(
                  height: 16,
                ),
                Platform.isIOS
                    ? Column(
                        children: [
                          SocialLoginButton(
                            onPressed: () {
                              context.read<SigninCubit>().signinWithApple();
                            },
                            image: AppAssets.applIcon,
                            title: 'تسجيل بواسطة أبل',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
