import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_router.dart';
import 'package:west_elbalad/core/utils/my_bindings.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        );
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: MyBindings(),
          initialRoute: AppRouter.kSplashView,
          getPages: AppRouter.routes,
          theme: ThemeData(
            fontFamily: appFontMontserrat,
            scaffoldBackgroundColor: AppColors.white,
          ),
        );
      },
    );
  }
}
