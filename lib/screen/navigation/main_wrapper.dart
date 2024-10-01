import 'package:flutter/material.dart';
import 'package:yah_app/screen/dashboard/dashboard_screen.dart';
import 'package:yah_app/screen/home_screen/home_screen.dart';
import 'package:yah_app/styles/style.dart';

import '../home_screen/dashboard_home_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        print('will Pop - scope');
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          surfaceTintColor: primary,
          backgroundColor: yBackgroundColor,
          animationDuration: Durations.medium1,
          selectedIndex: _selectedIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home_outlined),
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              selectedIcon: Icon(Icons.category),
              label: 'dashborard',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _selectedIndex,
            children: const [
              DashboardHomeScreen(),
              DashboardScreen(),
              HomeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
