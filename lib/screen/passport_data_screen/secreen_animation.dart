import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yah_app/providers/provider_passboard.dart';
import 'package:provider/provider.dart';

import '../../Widget/screen search/loading.dart';
import '../../Widget/screen search/show_loading.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
          .pushReplacement(SlideTransitionAnimation(const SecondPage()));
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
        backgroundColor: const Color.fromARGB(255, 254, 253, 250),
        body: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 6000),
              curve: Curves.fastLinearToSlowEaseIn,
              width: _a ? _width : 0,
              color: const Color.fromARGB(255, 0, 0, 0),
              height: _height,
            ),
            Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.15,
                    left: MediaQuery.of(context).size.width * 0.065,
                    right: MediaQuery.of(context).size.width * 0.065,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 13),
                            blurRadius: 25,
                            color: const Color(0xFF5666C2).withOpacity(0.17),
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
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
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

    super.initState();
  }

  @override
  void didChangeDependencies() {
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
    final myProvider = Provider.of<PassportProvider>(context, listen: false);
    CollectionReference ref =
        FirebaseFirestore.instance.collection("Customers");

    QuerySnapshot querySnapshot = await ref
        .where("numPassport", isEqualTo: myProvider.getNumberPassbord())
        .get();

    List mylist = [];
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        mylist.add(doc.data());
      }
      filterData1 = Passbord(
          numberPassbord: mylist[0]["numPassport"],
          state: mylist[0]["StatusTrans"],
          name: mylist[0]["NameCust"],
          phone: mylist[0]["numberPhone"],
          another: mylist[0]["TypeTrans"],
          image: mylist[0]['ImageTrans']);
      print("-------------------------------");
      setState(() {
        _isLoding = false;
        _isCheck = true;
      });
    }
  }

  @override
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
                            speed: const Duration(milliseconds: 150),
                            textStyle: const TextStyle(
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

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
