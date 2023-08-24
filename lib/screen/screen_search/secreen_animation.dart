import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yah_app/screen/Hom%20Screen/home_screen.dart';
import 'package:yah_app/screen/screen_search/dataselect.dart';
import 'package:yah_app/styles/style.dart';
import 'package:yah_app/styles/provider_passboard.dart';
import 'package:provider/provider.dart';

import '../../Widget/screen search/loading.dart';
import '../../Widget/screen search/show_loading.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 2090), () {
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
        backgroundColor: Color.fromARGB(255, 254, 253, 250),
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 6000),
              curve: Curves.fastLinearToSlowEaseIn,
              width: _a ? _width : 0,
              color: Color.fromARGB(255, 0, 0, 0),
              height: _height,
              // color: Color.fromARGB(255, 234, 166, 18),
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
  late List<Passbord> Data;
  var filterData1;
  String? searchNumber;

  @override
  void initState() {
    getData().then((value) {
      setState(() {
        _isLoding = false;
        // _isCheck = true; // _isCheck = true;
      });
    });
    // _isLoding = true;
    // Provider.of<PasspordProvider>(context, listen: false).fectData().then((_) {
    // Data = Provider.of<passpordProvider>(context, listen: false).listClint;
    // if (!Data.isEmpty) {
    //   filterData1 = Data.firstWhere(
    //     (element) => element.numberPassbord.toString() == searchNumber,
    //   );
    // }
    // _isLoding = false;
    // try {
    //   Timer(Duration(seconds: 2), () {
    //     setState(() {
    //       if (filterData1!.numberPassbord.isEmpty) {
    //         _isLoding = true;
    //         _isCheck = false;
    //         print("xxxxxxxxxxxxxxxxxxxxxxx");
    //       } else {
    //         // print("xxxxxxxxxxxxxxxxxxxxxxx");
    //         // _isCheck =
    //         //     Provider.of<passpordProvider>(context).searchList("123456789");
    //         // filterData = Data.firstWhere(
    //         //     (element) => element.numberPassbord == searchNumber);
    //         _isLoding = false;

    //         print("xxxxxxxxxxxxxxxxxxxxxxx" + _isCheck.toString());
    //       }
    //     });
    //   });
    // } catch (_) {
    //   //
    // }
    // _isLoding = false;
    // print("xxxxxxxxxxxxxxxxxxxxxxx");
    // _isCheck = false;
    // });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // searchNumber = Provider.of<PasspordProvider>(context, listen: true)
    //     .getNumberPassbord();

    // _isCheck = Provider.of<PasspordProvider>(context, listen: true).getExist();
    // if (_isCheck) {
    //   filterData1 =
    //       Provider.of<PasspordProvider>(context, listen: true).getPasspordVar();
    //   _isLoding = false;
    // } else {
    //   Timer(Duration(seconds: 2), () {
    //     _isLoding = false;
    //   });
    // }

    // if (filterData1.toString().isEmpty) _isCheck = false;
    // _isCheck = filterData.toString().isEmpty;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _isCheck = false;
    _isLoding = true;
    filterData1 = null;
    super.dispose();
  }

  Future<void> getData() async {
    final myProvider = Provider.of<PasspordProvider>(context, listen: false);
    CollectionReference ref = FirebaseFirestore.instance.collection("users");

    QuerySnapshot querySnapshot = await ref
        .where("passboard_num", isEqualTo: myProvider.getNumberPassbord())
        .get();

    List mylist = [];
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((doc) {
        mylist.add(doc.data());
      });
      filterData1 = Passbord(
          numberPassbord: mylist[0]["passboard_num"],
          state: mylist[0]["state"],
          name: mylist[0]["name"],
          phone: "772323",
          another: mylist[0]["typeVisa"],
          image: mylist[0]["imageUrl"]);
      print("-------------------------------");
      setState(() {
        _isLoding = false;
        _isCheck = true;
      });
    }
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
              child: _isCheck
                  ? DataVisa(filterData: filterData1, size: size)
                  : Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'حاول مرة اخرى',
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
