import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yah_app/providers/service_provider.dart';
import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';
import 'package:yah_app/screen/servis/sirvec_page.dart';
import 'package:yah_app/screen/servis/sirvece_screen.dart';
import 'package:yah_app/screen/kaian__screen.dart';
import 'package:yah_app/styles/myprovider.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:provider/provider.dart';

Image myImage = Image.asset("assets/image/me.jpg");
int _selectedIndex = 0;
void _xx(int index) {
  _selectedIndex = index;
}

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<passpordProvider>(
          create: (_) => passpordProvider()),
      ChangeNotifierProvider<ProviderService>(create: (_) => ProviderService()),
      ChangeNotifierProvider(create: (_) => ProviderShowService()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  void initState() {
    checkConnecrivity();
  }

  void checkConnecrivity() async {
    var result = await Connectivity().checkConnectivity();
    print(result.name);
  }

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
        home: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return snapshot.data == ConnectivityResult.none
                  ? Center(
                      child: Text("No Inter net Connecrion "),
                    )
                  : firstScreen();
            }),
        debugShowCheckedModeBanner: false,
        routes: {
          // '/': (context) => firstScreen(),
          Screen2.routeName: (context) => Screen2(),
          ShowService.routeName: (context) => ShowService(),
          PageService.routeName: (context) => PageService(),
        });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
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
