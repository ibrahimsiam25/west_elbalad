import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:west_elbalad/features/auth/presentation/views/widgets/foreget_password_view_body.dart';



class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'اعادة تعيين كلمة المرور'),
      body: ForgetPasswordViewBody(),
    );
  }
}