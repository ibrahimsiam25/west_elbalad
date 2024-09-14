import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import '../../../../../core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import '../../../../../core/service/shared_preferences_singleton.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
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

  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/images/splash.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          setState(() {});
        } else if (_controller.value.position.inMilliseconds -
                _controller.value.duration.inMilliseconds <
            1) {
          setState(() {});
        } else {}
      });
    _controller.play();
    _controller.setLooping(true);
    executeNavigation();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [
                VideoPlayer(_controller),
                Column(
                  children: [
                    Spacer(),
                    Container(
                      height: 6.0,
                      color: AppColors.white,
                    ),
                  ],
                )
              ]),
            )
          : const SizedBox(),
    );
  }
}
