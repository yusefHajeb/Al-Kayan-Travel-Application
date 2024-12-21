import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yah_app/Widget/kayancontent/appbar_contant.dart';
import 'package:yah_app/styles/style.dart';
import '../../Widget/AnimaiWidget/BouncingButton.dart';

// ignore: must_be_immutable
class AccountsScreen extends StatelessWidget {
  AccountsScreen({Key? key}) : super(key: key);
  List myIcons = [
    "assest/icon/icons8-facebook-64.png",
    "assest/icon/hiclipart.com (2).png",
    "assest/icon/icons8-telegram-app-64.png",
    "assest/icon/icons8-whatsapp-64.png",
    "assest/icon/icons8-instagram-64.png",
    "assest/icon/hiclipart.com.png",
  ];
  var number = "+967771274299";
  String msg = " Hello";
  // ignore: prefer_final_fields
  List<Uri> _listLunchUrl = [
    Uri.parse(('https://www.facebook.com/AlkayanTravel')),
    Uri(
        scheme: 'mailto',
        path: 'watanalihsas@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Testing mail lunch from flutter app',
          'body': 'this mail body is from flutter code'
        })),

    //sms
    Uri(scheme: 'sms', path: '+967771274299', queryParameters: <String, String>{
      'body': Uri.encodeFull('مرحبا مكتب الكيان'),
    }),
    //whatsapp

    Uri.parse(
        "whatsapp://send?phone=+967771274299&text=${Uri.encodeFull('السلام عليكم')}"),

    //phone
    Uri(
      scheme: 'tel',
      path: '+967771274299',
    ),

    Uri(
      scheme: 'tel',
      path: '+967771274299',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          const AppBarHeader(title: "حساباتنا"),
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(_w / 60),
                crossAxisCount: columnCount,
                children: List.generate(
                  6,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: BouncingButton(
                            onPress: () {},
                            child: InkWell(
                              onTap: () {
                                _lunchUrl(_listLunchUrl[index]);
                              },
                              child: Container(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    myIcons[index],
                                    // fit: BoxFit.none,
                                    // width: 20,
                                    // height: 21,
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  bottom: _w / 30,
                                  left: _w / 60,
                                  right: _w / 60,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  gradient: const LinearGradient(
                                      colors: [Colors.white, yBackgroundColor],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Colors.black, style: BorderStyle.solid),
              ),
              child: TextButton(
                onPressed: () {
                  myDialoge(context);
                },
                child: Text(
                  "حول المطور",
                  style: paragraph,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _lunchUrl(Uri url) async {
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw "Couldent lunch $url";
    }
  } catch (_) {}
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}->${Uri.encodeComponent(e.value)}')
      .join('&');
}

Color purple = const Color.fromARGB(255, 255, 170, 0);
Color blue = const Color.fromARGB(255, 251, 212, 169);
Color navy = const Color(0xff0f0434);

Widget topCardWidget() {
  return Text(
    'customize as you wish.',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white.withOpacity(.85),
    ),
  );
}

// This widget will be passed as Bottom Card's Widget.
Widget bottomCardWidget() {
  return Text(
    'customize as you wish.',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white.withOpacity(.85),
    ),
  );
}

Future<void> myDialoge(BuildContext ctx) async {
  return showDialog(
      context: ctx,
      builder: ((ctx) {
        return AlertDialog(
          title: const Text(
            "برمجة وتطوير",
            style: paragraph2,
          ),
          content: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'YAH',
                style: paragraph,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: const Text(
                        'يوسف حاجب', // "771274299",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.bold),
                      )),
                  const Icon(
                    Icons.link,
                    size: 19,
                    color: Colors.black54,
                  )
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("اغلاق"))
          ],
        );
      }));
}
