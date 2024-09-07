import 'package:flutter/material.dart';
import 'package:west_elbalad/core/constants/app_colors.dart';
import 'package:west_elbalad/core/constants/app_consts.dart';
import 'package:west_elbalad/features/home/presentation/views/home_view.dart';

class BottomNavBarController extends StatelessWidget {
  const BottomNavBarController({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: index,
        onTap: (int value) {
          index = value;
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
        children: const [
          HomeView(),
          Scaffold(
            body: Center(
              child: Text('Settings'),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text('Profile'),
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
          color: AppColors.blueAccent,
          borderRadius: BorderRadius.circular(
            kRadius32,
          ),
        ),
        child: Icon(
          icon,
        ),
      ),
      icon: Icon(
        icon,
      ),
      label: '',
    );
  }
}
