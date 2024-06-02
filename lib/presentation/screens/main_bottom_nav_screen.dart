import 'package:flutter/material.dart';
import 'package:job_search/presentation/providers/main_bottom_nav_screen_provider.dart';
import 'package:provider/provider.dart';

class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({super.key});

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
