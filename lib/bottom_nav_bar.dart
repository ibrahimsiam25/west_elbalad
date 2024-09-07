import 'package:flutter/material.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/presentation/views/home_view.dart';

class BottomNavBarController extends StatefulWidget {
  const BottomNavBarController({super.key});
  static const String routeName = '/BottomNavBarController';
  @override
  State<BottomNavBarController> createState() => _BottomNavBarControllerState();
}

class _BottomNavBarControllerState extends State<BottomNavBarController> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: index,
        onTap: (int value) {
          setState(() {
            index = value;
          });
        },
        items: [
          bottomNavBarItem(
            'assets/images/home.png',
          ),
          bottomNavBarItem(
            'assets/images/setting.png',
          ),
          bottomNavBarItem(
            'assets/images/user.png',
          ),
        ],
      ),
      body: IndexedStack(
        index: index,
        children: [
          HomeView(),
          Scaffold(
            body: Center(
              child: Text(
                'Settings',
                style: AppStyles.header,
              ),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text(
                'Profile',
                style: AppStyles.header,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(String image) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(
            kRadius32,
          ),
        ),
        child: Image.asset(
          width: 40.0,
          height: 40.0,
          image,
        ),
      ),
      icon: Image.asset(
        width: 40.0,
        height: 40.0,
        image,
      ),
      label: '',
    );
  }
}
