import 'package:flutter/material.dart';
import 'package:yah_app/screen/dashboard/dashboard_screen.dart';
import 'package:yah_app/screen/home_screen/home_screen.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  static GlobalKey<NavigatorState> useListNavigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: useListNavigatorKey,
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (BuildContext context) {
          if (setting.name == '/users') {
            return Container();
          } else if (setting.name == '/dashboard') {
            return const DashboardScreen();
          } else if (setting.name == '/setting') {
            return Container();
          }
          // return SettingScreen();
          else if (setting.name == '/home_page') {
            return const HomeScreen();
          }

          return Container();
        });
      },
    );
  }
}
