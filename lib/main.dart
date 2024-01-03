// import 'dart:convert';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yah_app/providers/service_provider.dart';

import 'package:yah_app/screen/services_screen/sirvec_page.dart';
import 'package:yah_app/screen/services_screen/sirvece_screen.dart';
import 'package:yah_app/screen/alhayan%20content/kaian__screen.dart';
import 'package:yah_app/screen/splash%20screen/splash_screen.dart';
import 'package:yah_app/styles/myprovider.dart';
import 'package:yah_app/styles/provider_passboard.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;
import 'package:yah_app/styles/style.dart';

Image myImage = Image.asset("assets/image/me.jpg");
int _selectedIndex = 0;
void _xx(int index) {
  _selectedIndex = index;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // future:
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PasspordProvider>(create: (_) => PasspordProvider()),
    ChangeNotifierProvider<ProviderService>(create: (_) => ProviderService()),
    ChangeNotifierProvider(create: (_) => ServicesProvider()),
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
          Screen2.routeName: (context) => const Screen2(),
          ShowService.routeName: (context) => const ShowService(),
          PageService.routeName: (context) => const PageService(),
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
    return const Screen2();
  }
}
