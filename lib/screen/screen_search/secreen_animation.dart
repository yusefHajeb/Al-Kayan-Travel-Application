import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widget/new_page.dart';
import '../../styles/tolls.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }

// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//             width: 400,
//             margin: EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 6),
//                   blurRadius: 17,
//                   spreadRadius: -20,
//                   color: Colors.black,
//                 ),
//               ],
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(29.5),
//             ),
//             //  color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
//             child: TextField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: "ابحث برقم ",
//                 icon: Icon(Icons.search),
//                 border: InputBorder.none,
//                 suffixIcon: OpenContainer(
//                   closedBuilder: (_, openContainer) {
//                     return Container(
//                       height: 80,
//                       width: 80,
//                       child: Center(
//                         child: Text(
//                           'بحث',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   openColor: Colors.white,
//                   closedElevation: 20,
//                   closedShape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   transitionDuration: Duration(milliseconds: 700),
//                   openBuilder: (_, closeContainer) {
//                     return SecondScreen();
//                   },
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(SecondPage()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 6000),
              curve: Curves.fastLinearToSlowEaseIn,
              width: _a ? _width : 0,
              height: _height,
              color: Color.fromARGB(255, 238, 224, 194),
            ),
            Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image.asset(
                  //   "assest/image/14_No Search Results.png",
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.15,
                    left: MediaQuery.of(context).size.width * 0.065,
                    right: MediaQuery.of(context).size.width * 0.065,
                    child: Container(
                      child:
                          Image.asset("assest/image/14_No Search Results.png"),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 13),
                            blurRadius: 25,
                            color: Color(0xFF5666C2).withOpacity(0.17),
                          ),
                        ],
                      ),
                      // child: TextField(
                      //   style: TextStyle(fontSize: 12),
                      //   onChanged: (value) {},
                      //   decoration: InputDecoration(
                      //     hintText: "Search...",
                      //     contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      //     fillColor: Colors.white,
                      //     filled: true,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(50),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     suffixIcon: Icon(
                      //       Icons.search,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                child: page,
              );
            });
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('الاستعلام'),
          centerTitle: true,
          backgroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      body: Column(
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [bBackDark, Color.fromARGB(255, 56, 24, 2)]
                      // primary, Color.fromARGB(255, 170, 143, 76)],
                      ),
                ),
              )),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'معاملتك قيد ',
                  speed: Duration(milliseconds: 150),
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            ),
          ),
        ],
      ),
    );
  }
}
