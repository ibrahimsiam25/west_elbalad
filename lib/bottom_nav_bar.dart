import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/core/utils/app_styles.dart';
import 'package:west_elbalad/features/home/presentation/views/home_view.dart';

class BottomNavBarController extends StatefulWidget {
  const BottomNavBarController({super.key});

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
        backgroundColor: AppColors.lightGrey,
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
            Icons.home,
          ),
          bottomNavBarItem(
            Icons.settings,
          ),
          bottomNavBarItem(
            Icons.person,
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

  BottomNavigationBarItem bottomNavBarItem(IconData icon) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(
            kRadius32,
          ),
        ),
        child: Icon(
          icon,
          size: 26.r,
          color: AppColors.white,
        ),
      ),
      icon: Icon(
        icon,
        size: 26.r,
        color: AppColors.black,
      ),
      label: '',
    );
  }
}
