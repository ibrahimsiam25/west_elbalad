import 'package:flutter/material.dart';
import 'package:west_elbalad/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/SplashView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFCC00),
      body: SplashViewBody(),
    );
  }
}
