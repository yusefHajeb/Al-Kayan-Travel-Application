// import 'dart:html';
// import 'package:flutter/cupertino.dart';
// import 'dart:html';
// import 'dart:html';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:yah_app/styles/style.dart';
import 'package:yah_app/styles/provider_passboard.dart';
// import 'package:slimy_card/slimy_card.dart';
import '../../Widget/AnimaiWidget/BouncingButton.dart';
import '../../styles/tolls.dart';

class ScreenMedia extends StatelessWidget {
  @override
  List myIcons = [
    "assest/icon/icons8-facebook-64.png",
    "assest/icon/icons8-twitter-64.png",
    "assest/icon/icons8-telegram-app-64.png",
    "assest/icon/icons8-whatsapp-64.png",
    "assest/icon/icons8-instagram-64.png",
    "assest/icon/icons8-instagram-64.png",
  ];
  var number = "+967771274299";
  String msg = " Hello";
  // ignore: prefer_final_fields
  List<Uri> _listLunchUrl = [
    //https
    // Uri.https('whatsapp:send?phone=+967771274299&text=Hellow'),
    Uri(
        scheme: 'whatsapp',
        path: 'https://api.whatsapp.com/send?phone=+967734084140&text=hello',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Testing mail lunch from flutter app',
          'body': 'this mail body is from flutter code'
        })),
    //mail
    Uri(
        scheme: 'mailto',
        path: 'watanalihsas@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Testing mail lunch from flutter app',
          'body': 'this mail body is from flutter code'
        })),
//whatsapp
    Uri(
      scheme: 'whatsapp',
      path: '//api.whatsapp.com/send?phone=967771274299&text=Hellow',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Testing whatsapp lunch from flutter app',
        'body': 'this whatsapp body is from flutter code'
      }),
    ),
//sms
    Uri(scheme: 'sms', path: '+967771274299', queryParameters: <String, String>{
      'body': Uri.encodeComponent('Hello'),
    }),

    //phone
    Uri(
      scheme: 'tel',
      path: '+967771274299',
    ),

    Uri(
      scheme: 'tel',
      path: '+967771274299',
    ),

    Uri(
      scheme: 'tel',
      path: '+967771274299',
    ),
  ];

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "حساباتنا ",
          style: header2,
        ),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(_w / 60),
                crossAxisCount: columnCount,
                children: List.generate(
                  6,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Bouncing(
                            onPress: () {},
                            child: InkWell(
                              onTap: () {
                                _lunchUrl(_listLunchUrl[index]);
                              },
                              child: Container(
                                child: Image.asset(
                                  myIcons[index],
                                  // fit: BoxFit.cover,
                                  width: 50,
                                ),
                                margin: EdgeInsets.only(
                                    bottom: _w / 30,
                                    left: _w / 60,
                                    right: _w / 60),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  gradient: LinearGradient(
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

          // SlimyCard(
          //   topCardWidget: topCardWidget(),
          //   bottomCardWidget: bottomCardWidget(),
          // ),
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

Color purple = Color.fromARGB(255, 255, 170, 0);
Color blue = Color.fromARGB(255, 251, 212, 169);
Color navy = Color(0xff0f0434);

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
