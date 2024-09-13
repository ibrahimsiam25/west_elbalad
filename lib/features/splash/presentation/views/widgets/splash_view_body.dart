import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import '../../../../../core/service/shared_preferences_singleton.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
    initializeVideoPlayer();
  }

  void executeNavigation() {
    bool isOnBoardingView = SharedPref.getBool(kIsOnBoardingView);
    bool isSigninView = SharedPref.getBool(kIsSigninView);
    Future.delayed(
      Duration(milliseconds: 4500),
      () {
        if (isOnBoardingView) {
          if (isSigninView) {
            GoRouter.of(context).go(AppRouter.kBottomNavBarController);
          } else {
            GoRouter.of(context).go(AppRouter.kSigninView);
          }
        } else {
          GoRouter.of(context).go(AppRouter.kOnBoardingView);
        }
      },
    );
  }

  late VideoPlayerController controller;
  void initializeVideoPlayer() {
    controller = VideoPlayerController.asset('assets/images/splash.mp4')
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then(
        (_) {
          controller.play();
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
          : const SizedBox(),
    );
  }
}
