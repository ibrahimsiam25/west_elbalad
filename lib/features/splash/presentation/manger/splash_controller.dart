import 'package:get/get.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import '../../../../core/service/shared_preferences_singleton.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _executeNavigation();
    super.onInit();
  }

  void _executeNavigation() {
    bool isOnBoardingView = SharedPref.getBool(kIsOnBoardingView);
    Future.delayed(
      Duration(milliseconds: 4500),
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
