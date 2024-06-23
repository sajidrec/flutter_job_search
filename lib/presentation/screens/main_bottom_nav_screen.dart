import 'package:flutter/material.dart';
import 'package:job_search/presentation/providers/main_bottom_nav_screen_provider.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:provider/provider.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({
    super.key,
  });

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(),
      body: Consumer<MainBottomNavScreenProvider>(
        builder: (context, value, child) {
          return value.getScreen();
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Consumer<MainBottomNavScreenProvider>(
        builder: (context, value, child) {
      return BottomNavigationBar(
        backgroundColor: AppColors.primaryShade.withOpacity(0.65),
        selectedItemColor: AppColors.textWhite,
        unselectedItemColor: AppColors.textWhite.withOpacity(0.45),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          value.setCurrentIndex = index;
        },
        currentIndex: value.getCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      );
    });
  }
}
