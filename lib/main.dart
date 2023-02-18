import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yah_app/Widget/about.dart';
import 'package:yah_app/Widget/servece_card.dart';
import 'package:yah_app/screen/first_screen.dart';
import 'package:yah_app/screen/sirvec_page.dart';
import 'package:yah_app/screen/sirvece_screen.dart';
import 'package:yah_app/screen/why_kaian.dart';
import 'package:yah_app/home_old.dart';
import 'package:yah_app/screen/kaian_screen.dart';
import 'package:yah_app/why_kian.dart';
import 'Widget/reponsive_card.dart';
// import 'Widget/widget_tools/progres_button.dart';
import 'Widget/widget_tools/button_slide.dart';
import 'tolls.dart';
import 'Widget/bottomNav.dart';

Image myImage = Image.asset("assets/image/me.jpg");
int _selectedIndex = 0;
void _xx(int index) {
  _selectedIndex = index;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "Cairo",
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
          '/': (context) => MyCustomWidget(),
          AboutUs.routeName: (context) => AboutUs(),
          Screen2.routeName: (context) => Screen2(),
          SrvessScreen.routeName: (context) => SrvessScreen(),
          PageService.routeName: (context) => PageService(),
        });
  }
}

final List<Map<String, Object>> _page = [
  {
    'page': Scaffold(body: Center()),
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
    return Scaffold();
  }
}
