// import 'dart:async';

import 'dart:async';

import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:yah_app/Widget/widget_tools/list_anmi.dart';
import 'package:yah_app/screen/sirvece_screen.dart';
import 'package:yah_app/screen/why_kaian.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:yah_app/Widget/catagory_curd.dart';
import 'package:yah_app/screen/kaian_screen.dart';

import '../Widget/widget_tools/BouncingButton.dart';
import '../Widget/widget_tools/mydrawer.dart';
import '../Widget/widget_tools/secreen_animation.dart';
import '../Widget/widget_tools/text_ani,ation.dart';
import '../main.dart';

int _currentPage = 0;
void select_screen(BuildContext ctx, int tab) {}

void SelectScreen2(BuildContext ctx, int index) {
  Navigator.of(ctx).pushNamed(Screen2.routeName, arguments: index);
}

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);
  static const roteName = "Screen Home";

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  late PageController _pageController;
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // int currentCarouselIndex = 0;
    // Timer t = Timer(const Duration(seconds: 2), () {
    //   setState(() => currentCarouselIndex++);
    //   print(currentCarouselIndex);
    // });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Flex(direction: Axis.vertical, children: <Widget>[
        Expanded(
            flex: 6,
            child: Stack(children: [
              Image.asset(
                "assest/image/thim3.png",
                alignment: Alignment.center,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ])),
        const SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Container(
              width: 400,
              margin: const EdgeInsets.only(
                  top: 0, right: 30, left: 30, bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(
                    offset: const Offset(0, 6),
                    blurRadius: 17,
                    spreadRadius: -20,
                    color: Colors.black,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(29.5),
              ),
              //  color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "ابحث برقم الجواز",
                  icon: const Icon(Icons.search),
                  border: InputBorder.none,
                  suffixIcon: OpenContainer(
                    closedBuilder: (_, openContainer) {
                      return Container(
                        height: 80,
                        color: Colors.transparent,
                        width: 80,
                        child: const Center(
                          child: Text(
                            'بحث',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    openColor: Colors.white,
                    closedElevation: 20,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    transitionDuration: const Duration(milliseconds: 700),
                    openBuilder: (_, closeContainer) {
                      return SecondScreen();
                    },
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 200,
            padding: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 10,
              child: Container(
                padding: const EdgeInsets.all(0),
                child: PageView.builder(
                    itemCount: dataList.length,
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: carousView(index, size),
                      );
                    }),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              CatagoryCount(
                titleCurd: "لماذا كيان",
                myIcon: const Icon(
                  Icons.diamond,
                  color: Colors.blue,
                  size: 50,
                ),
                press: () {
                  setState(() {
                    SelectScreen2(context, 1);
                  });
                },
              ),
              CatagoryCount(
                titleCurd: "لماذا كيان",
                myIcon: const Icon(
                  Icons.diamond,
                  size: 50,
                  color: const Color.fromARGB(255, 22, 51, 26),
                ),
                press: () {
                  setState(() {
                    select_screen(context, 1);
                  });
                },
              ),
              CatagoryCount(
                titleCurd: "شركائنا",
                myIcon: const Icon(
                  Icons.handshake,
                  color: const Color.fromARGB(255, 22, 51, 26),
                  size: 50,
                ),
                press: () {
                  setState(() {
                    SelectScreen2(context, 2);
                  });
                },
              ),
              CatagoryCount(
                titleCurd: "الفروع",
                myIcon: const Icon(
                  Icons.slideshow,
                  color: const Color.fromARGB(255, 22, 51, 26),
                ),
                press: () {
                  setState(() {
                    SelectScreen2(context, 3);
                  });
                },
              ),
              CatagoryCount(
                titleCurd: "حساباتنا",
                myIcon: const Icon(
                  Icons.media_bluetooth_on,
                  size: 30,
                  color: Color.fromARGB(255, 22, 51, 26),
                ),
                press: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => CardNew())));
                  });
                  // Navigator.of(context).push(MyCustomUI());
                },
              ),
              CatagoryCount(
                  titleCurd: "خدماتنا",
                  myIcon: const Icon(Icons.design_services),
                  press: () {
                    setState(() {
                      Navigator.of(context).pushNamed(SrvessScreen.routeName);
                    });
                  }),
            ]),
          ),
        ),
      ]),
      // bottomNavigationBar: CurvedNavigationBar(
      //   items: <Widget>[
      //     Icon(Icons.add, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       index = index;
      //     });
      //   },
      // ),
    );
  }

  Widget carousView(int index, Size s) {
    return Bouncing(
      onPress: () {},
      child: Container(
        child: AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0.0;
              if (_pageController.position.haveDimensions) {
                value = index.toDouble() - (_pageController.page ?? 0);
                value = (value * 0.038).clamp(-1, 1);
                print("value $value indexss $index");
              }
              return Transform.rotate(
                angle: -3.14 * value,
                child: crouseCard(dataList[index], s),
              );
            }),
      ),
    );
  }

  Widget crouseCard(DataModel data, Size size) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height / 5,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 175, 107, 107),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  data.imageName,
                ),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black)
              ]),
        )
      ],
    );
  }
}
