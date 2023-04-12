import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yah_app/styles/style.dart';
import 'package:yah_app/styles/tolls.dart';
import 'package:provider/provider.dart';

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
  final x = 0;
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

int index = 24434;

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondePage();
}

class _SecondePage extends State<SecondPage> {
  late bool _isLoding = true;
  late bool _isCheck = false;
  late List<passbord> Data;
  var filterData;
  String searchNumber = "123456789";
  @override
  void initState() {
    // _isLoding = true;
    Provider.of<passpordProvider>(context, listen: false).fectData().then((_) {
      Data = Provider.of<passpordProvider>(context, listen: false).listClint;
      if (Data.isEmpty) {
        _isLoding = true;
      } else {
        print("xxxxxxxxxxxxxxxxxxxxxxx");
        // _isCheck =
        //     Provider.of<passpordProvider>(context).searchList(searchNumber);

        filterData =
            Data.firstWhere((element) => element.numberPassbord == 123456789);

        _isLoding = false;
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    // searchNumber = Provider.of<passpordProvider>(context, listen: true)
    //     .getNumberPassbord();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text("عرض البيانات"),
          centerTitle: true,
          backgroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      body: _isLoding
          ? SizedBox(height: size.height, child: ShowSktolin(size: size))
          : SizedBox(
              height: size.height,
              child: !_isLoding
                  ? clintData(filterData: filterData, size: size)
                  : Center(
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
            ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class clintData extends StatelessWidget {
  const clintData({
    Key? key,
    required this.filterData,
    required this.size,
  }) : super(key: key);

  final passbord filterData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Card(
            semanticContainer: false,
            elevation: 20,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(20.0),
            // padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    filterData.name,
                    style: header,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    filterData.image,
                    fit: BoxFit.cover,
                    width: size.width - 50,
                    height: size.height / 3,
                    // color: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    " صاحب الجواز :" + filterData.name,
                    style: header2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    " الرقم :" + filterData.phone,
                    style: header2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    " نوع المعاملة :" + filterData.state,
                    style: header2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    " نوع المعاملة :" + filterData.state,
                    style: header2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowSktolin extends StatelessWidget {
  const ShowSktolin({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Column(
              children: const [
                Skelton(
                  height: 20,
                  width: 230,
                ),
                SizedBox(
                  height: 5,
                ),
                Skelton(
                  height: 20,
                  width: 230,
                ),
              ],
            )),
            Skelton(
              height: 30,
              width: 120,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Skelton(
              width: size.width - 50,
              height: size.height / 3,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: const [
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                  ],
                )),
                Skelton(
                  height: 30,
                  width: 120,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: const [
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                  ],
                )),
                Skelton(
                  height: 30,
                  width: 120,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: const [
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                  ],
                )),
                Skelton(
                  height: 25,
                  width: 120,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
