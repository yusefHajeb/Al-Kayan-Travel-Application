import 'package:flutter/material.dart';
import 'package:yah_app/Widget/scale_transition.dart';
import 'package:yah_app/screen/dashboard/add_user_passport.dart';

import '../screen/dashboard/add_service_dashboard.dart';
import '../screen/dashboard/add_service_screen.dart';
import '../screen/home_screen/home_screen.dart';

class DashboardCardData {
  final String name;
  final String navigateTo;
  final String imageLink;
  final VoidCallback onTap;
  DashboardCardData({
    required this.onTap,
    required this.name,
    required this.navigateTo,
    required this.imageLink,
  });
  static List<DashboardCardData> dashboardData(BuildContext context) {
    return [
      DashboardCardData(
        onTap: () => Navigator.of(context)
            .push(ScaleTransitionScreen(const HomeScreen())),
        name: 'الرئيسية',
        navigateTo: '/home_page',
        imageLink: 'assest/icon/home_page_icon.png',
      ),
      DashboardCardData(
        onTap: () => Navigator.of(context)
            .push(ScaleTransitionScreen(const UserDetAddUserPassportScreen())),
        name: 'إضافة معاملة',
        navigateTo: '/users',
        imageLink: 'assest/icon/user_icon.png',
      ),
      DashboardCardData(
        onTap: () => Navigator.of(context)
            .push(ScaleTransitionScreen(const AddServiceTab())),
        name: 'إضافة خدمة',
        navigateTo: '/services',
        imageLink: 'assest/icon/service_icon.png',
      ),
      DashboardCardData(
        onTap: () => Navigator.of(context)
            .push(ScaleTransitionScreen(const AddAdsScreen())),
        name: 'إضافة إعلان',
        navigateTo: '/dashboard',
        imageLink: 'assest/icon/service_icon.png',
      ),
      DashboardCardData(
        onTap: () => Navigator.of(context)
            .push(ScaleTransitionScreen(const HomeScreen())),
        name: 'استعلام',
        navigateTo: '/inquiry',
        imageLink: 'assest/icon/service_icon.png',
      ),
    ];
  }
}
