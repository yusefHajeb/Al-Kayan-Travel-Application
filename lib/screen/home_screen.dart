// import 'dart:async';

import 'dart:async';
// import 'dart:html';

import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yah_app/Widget/new_page.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:yah_app/Widget/widget_tools/animai/list_anmi.dart';
import 'package:yah_app/screen/servis/sirvece_screen.dart';
import 'package:yah_app/screen/kaian__screen.dart';
import 'package:yah_app/styles/style.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:yah_app/Widget/card_widget/catagory_curd.dart';
// import 'package:yah_app/screen/kaian_screen.dart';

import '../Widget/AnimaiWidget/BouncingButton.dart';
import 'account_screen.dart';
import 'screen_search/secreen_animation.dart';
// import '../Widget/widget_tools/text_ani,ation.dart';
// import 'package:yah_app/styles/style.dart';
// import '../main.dart';

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
  // ignore: non_constant_identifier_names

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
    late var numPass;
    var messageError;
    GlobalKey<FormState> fromstat = new GlobalKey<FormState>();

    Search() async {
      var formdata = fromstat.currentState!;
      if (formdata.validate()) {
        formdata.save();
      } else {
        print("not valid");
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: Flex(direction: Axis.vertical, children: <Widget>[
        Expanded(
            flex: 6,
            child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [bBackDark, Color.fromARGB(255, 56, 24, 2)]
                        // primary, Color.fromARGB(255, 170, 143, 76)],
                        ),

                    // image: DecorationImage(

                    //   image: AssetImage("assest/image/imageKaian.png"),
                    // ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset(
                      "assest/image/imageKaian.png",
                      color: primary,
                    ),
                  ),
                ))
            // Stack(children: [
            //   Image.asset(
            //     "assest/image/thim3.png",
            //     alignment: Alignment.center,
            //     fit: BoxFit.fill,
            //     width: double.infinity,
            //   ),
            // ])),
            ),
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
              child: Form(
                key: fromstat,
                child: TextFormField(
                  onSaved: (val) {
                    numPass = val;
                  },
                  validator: (val) {
                    if (val!.length > 5) {
                      messageError = "رقم الجواز كبير  جدا";
                    }
                    if (val.length < 2) {
                      messageError = "القيمة المدخله خاطئة";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "ابحث برقم الجواز",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primary,
                    ),
                    border: InputBorder.none,
                    suffixIcon: OpenContainer(
                      closedBuilder: (_, openContainer) {
                        return InkWell(
                          onTap: () async {
                            await Search();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Stack(
                                  clipBehavior: Clip.none,
                                  // alignment: AlignmentDirectional.topStart,
                                  children: [
                                    // Positioned(
                                    //   top: -18,
                                    //   child: CircleAvatar(
                                    //     radius: 10,
                                    //     backgroundColor: bBackDark,
                                    //     child: Icon(
                                    //       Icons.close_rounded,
                                    //       color: primary,
                                    //       size: 20,
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      height: 90,
                                      decoration: const BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 47,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "خطاء",
                                                  style: header2,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(messageError),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20)),
                                        child: SvgPicture.asset(
                                          "assest/image/svg/bubbles.svg",
                                          height: 48,
                                          width: 48,
                                          color:
                                              Color.fromARGB(255, 212, 152, 0),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -20,
                                      right: 0,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assest/image/svg/fail.svg",
                                            height: 40,
                                            color: bBackDark,
                                          ),
                                          SvgPicture.asset(
                                            "assest/image/svg/close.svg",
                                            height: 15,
                                            color: Color.fromARGB(
                                                255, 212, 152, 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //svg
                                  ],
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          },
                          child: Container(
                            height: 140,
                            width: 80,
                            child: Center(
                              child: Text(
                                'استعلام',
                                style: paragraph2,
                              ),
                            ),
                          ),
                        );
                      },
                      openColor: Colors.white,
                      closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      transitionDuration: const Duration(milliseconds: 700),
                      openBuilder: (_, closeContainer) {
                        return SecondScreen();
                      },
                    ),
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 10,
              child: Container(
                // margin: EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(0),
                child: PageView.builder(
                    itemCount: dataList.length,
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
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
                titleCurd: "شركائنا",
                myIcon: const Icon(
                  Icons.handshake,
                  color: const Color.fromARGB(255, 22, 51, 26),
                  size: 50,
                ),
                press: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => MyHeader2())));
                  // setState(() {
                  //   SelectScreen2(context, 2);
                  // });
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ScreenMedia())));
                  });
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
          width: 250,
          height: size.height / 5,
          margin: const EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
              color: primary,
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
