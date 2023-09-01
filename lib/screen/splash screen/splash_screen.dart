import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';
import 'package:yah_app/styles/style.dart';
import 'package:flutter/services.dart';

import '../../dataBase/button_slide.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplateScreenState();
}

class SplateScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => firstScreen()));
    });
    scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.pushReplacement(
                  context,
                  AnimatingRoute(
                    route: Destination(),
                    page: Container(),
                  ),
                );
                Timer(
                  Duration(milliseconds: 300),
                  () {
                    // print('worked');
                    scaleController.reset();
                  },
                );
              }
            },
          );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assest/image/imageKaian.png",
              height: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  FadeAnimatedText(' الكيان الدولي للسفريات واالسياحة ',
                      textStyle: header2),
                  // FadeAnimatedText('للسفريات واالسياحة', textStyle: header2),
                  FadeAnimatedText('وخدمات الحج والعمرة', textStyle: header2),
                ],
              ),
            ),
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            // )
          ],
        ),
      ),
    );
  }
}
