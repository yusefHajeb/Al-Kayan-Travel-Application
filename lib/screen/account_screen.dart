// import 'dart:html';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:yah_app/styles/style.dart';
import 'package:yah_app/styles/tolls.dart';

import '../Widget/AnimaiWidget/BouncingButton.dart';

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
      body: AnimationLimiter(
        child: GridView.count(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                  duration: Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: Bouncing(
                      onPress: () {},
                      child: Container(
                        child: Image.asset(
                          myIcons[index],
                          // fit: BoxFit.cover,
                          width: 50,
                        ),
                        margin: EdgeInsets.only(
                            bottom: _w / 30, left: _w / 60, right: _w / 60),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

Color purple = Color.fromARGB(255, 255, 170, 0);
Color blue = Color.fromARGB(255, 251, 212, 169);
Color navy = Color(0xff0f0434);
