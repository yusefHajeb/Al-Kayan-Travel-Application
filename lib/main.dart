// import 'dart:convert';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yah_app/firebase_initial.dart';
import 'package:yah_app/providers/dashboard_provider.dart';
import 'package:yah_app/providers/service_provider.dart';
import 'package:yah_app/screen/notification/notification_screen.dart';
import 'package:yah_app/screen/services_screen/content_service_screen.dart';
import 'package:yah_app/screen/services_screen/our_service_screen.dart';
import 'package:yah_app/screen/splash%20screen/splash_screen.dart';
import 'package:yah_app/providers/myprovider.dart';
import 'package:yah_app/providers/provider_passboard.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yah_app/styles/style.dart';

import 'providers/form_provider.dart';
import 'screen/buttons_alkyan_branches_screen/Buttons_kyan_branches.dart';

Image myImage = Image.asset("assets/image/me.jpg");
int _selectedIndex = 0;
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // future:
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PassportProvider>(create: (_) => PassportProvider()),
    ChangeNotifierProvider<ProviderService>(create: (_) => ProviderService()),
    ChangeNotifierProvider(create: (_) => ServicesProvider()),
    ChangeNotifierProvider(create: (_) => FormProvider()),
    ChangeNotifierProvider(create: (_) => DashboardProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void initState() {
    checkConnecrivity();
  }

  void checkConnecrivity() async {
    // var result = await Connectivity().checkConnectivity();
    // print(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white38,
          fontFamily: 'ReadexPro',
          scaffoldBackgroundColor: yBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: ktextColor),
        ),
        locale: const Locale("ar", "AE"),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar", "AE")],
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          NotificationScreen.routeName: (context) => const NotificationScreen(),
          ButtonsKyanBranchesAndPartnersScreen.routeName: (context) =>
              const ButtonsKyanBranchesAndPartnersScreen(),
          OurSreviceScreen.routeName: (context) => const OurSreviceScreen(),
          ContentServiceScreen.routeName: (context) =>
              const ContentServiceScreen(),
        });
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

final List<Map<String, Object>> _page = [
  {
    'page': const Scaffold(body: Center()),
    'title': "Part1",
  },
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void selectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushNamed('/x1');
  }

  @override
  Widget build(BuildContext context) {
    return const ButtonsKyanBranchesAndPartnersScreen();
  }
}
