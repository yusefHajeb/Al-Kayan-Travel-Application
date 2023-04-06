import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';
import 'package:yah_app/screen/servis/sirvec_page.dart';
import 'package:yah_app/screen/servis/sirvece_screen.dart';
import 'package:yah_app/screen/kaian__screen.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:provider/provider.dart';

Image myImage = Image.asset("assets/image/me.jpg");
int _selectedIndex = 0;
void _xx(int index) {
  _selectedIndex = index;
}

void main() => runApp(
    ChangeNotifierProvider(create: (_) => passpordProvider(), child: MyApp()));

class MyApp extends StatelessWidget {
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
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => firstScreen(),
          Screen2.routeName: (context) => Screen2(),
          SrvessScreen.routeName: (context) => SrvessScreen(),
          PageService.routeName: (context) => PageService(),
        });
  }
}

final List<Map<String, Object>> _page = [
  {
    'page': const Scaffold(body: const Center()),
    'title': "Part1",
  },
];

class MyHomePage extends StatelessWidget {
  void selectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushNamed('/x1');
  }

  @override
  Widget build(BuildContext context) {
    return Screen2();
  }
}

class HomePage2 extends StatelessWidget {
  void selectScren(BuildContext ctx, int n) {
    Navigator.of(ctx).pushNamed(
      '/x',
    );
  }

  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
