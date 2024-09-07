import 'package:get/get.dart';
import 'package:west_elbalad/features/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:west_elbalad/features/splash/presentation/manger/splash_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
    );
    Get.lazyPut(
      () => OnBoardingController(),
    );
  }
}
