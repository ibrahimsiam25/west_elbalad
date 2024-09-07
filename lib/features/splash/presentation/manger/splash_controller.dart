import 'package:get/get.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/service/shared_preferences_singleton.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _executeNavigation();
  }

  void _executeNavigation() {
    bool isOnBoardingView = SharedPref.getBool(kIsOnBoardingView);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isOnBoardingView) {
          Get.offNamed(AppRouter.kBottomNavBarController);
        } else {
          Get.offNamed(AppRouter.kOnBoardingView);
        }
      },
    );
  }
}
