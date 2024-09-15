import 'package:flutter/material.dart';
import 'package:yah_app/screen/dashboard/add_service_dashboard.dart';
import 'package:yah_app/screen/dashboard/add_service_screen.dart';
import 'package:yah_app/screen/dashboard/add_user_passport.dart';
import 'package:yah_app/styles/style.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Dashboard'),
            bottom: const TabBar(
              physics: BouncingScrollPhysics(),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: primary),
                  insets: EdgeInsets.symmetric(horizontal: 16.0)),
              indicatorWeight: 4,
              indicatorPadding: EdgeInsets.zero,
              indicatorColor: primary,
              labelColor: Colors.black,
              labelStyle: header2,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: paragraph2,
              tabs: [
                Tab(
                  text: 'إضافة معاملة',
                ),
                Tab(
                  text: 'إضافة خدمة ',
                ),
                Tab(
                  text: 'إضافة إعلان',
                ),
              ],
            )),
        body: const TabBarView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 800),
              child: UserDetailsTab(),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: AddServiceTab(),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: AdcDashboardTab(),
            ),
          ],
        ),
      ),
    );
  }

  // int _selectedIndex = 0;
  void _onItemTapped(int index) {}

  void selectScreen(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed('/x1');
  }

  void selectScreen2(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed('/x2');
  }

  void selectScreen3(BuildContext ctx, int index) {
    Navigator.of(ctx).pushNamed('/x3');
  }
}
