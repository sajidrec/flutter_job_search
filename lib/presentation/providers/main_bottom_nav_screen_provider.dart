import 'package:flutter/material.dart';
import 'package:job_search/presentation/screens/home_screen.dart';

class MainBottomNavScreenProvider extends ChangeNotifier {
  int _getCurrentIndex = 0;

  set setCurrentIndex(int index) {
    _getCurrentIndex = index;
    notifyListeners();
  }

  int get getCurrentIndex => _getCurrentIndex;

  final List _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  Widget getScreen() {
    return _screens[_getCurrentIndex];
  }
}
