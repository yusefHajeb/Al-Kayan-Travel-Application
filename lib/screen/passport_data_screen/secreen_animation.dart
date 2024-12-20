import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yah_app/Widget/kayancontent/appbar_contant.dart';
import 'package:yah_app/providers/provider_passboard.dart';
import 'package:provider/provider.dart';

import '../../Widget/screen search/passbord_details.dart';
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

  Passport? _resonseData;
  String? searchNumber;

  @override
  void initState() {
    _getData().then((value) {
      setState(() {
        _isLoding = false;
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
    _resonseData = null;
    super.dispose();
  }

  Future<void> _getData() async {
    final myProvider = Provider.of<PassportProvider>(context, listen: false);
    final ref = FirebaseFirestore.instance.collection('Customers');

    try {
      final querySnapshot = await ref
          .where('numPassport', isEqualTo: myProvider.getNumberPassbord())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final mylist = querySnapshot.docs.map((doc) => doc.data()).toList();

        final data = mylist.first;
        _resonseData = Passport(
          numberPassport: data['numPassport']?.toString() ?? '',
          state: data['StatusTrans']?.toString() ?? '',
          name: data['NameCust']?.toString() ?? '',
          phone: data['numberPhone']?.toString() ?? '',
          another: data['TypeTrans']?.toString() ?? '',
          image: data['ImageTrans']?.toString() ?? '',
        );

        setState(() {
          _isLoding = false;
          _isCheck = true;
        });
      } else {
        setState(() {
          _isLoding = false;
          _isCheck = false;
        });
      }
    } on FirebaseException catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _isLoding = false;
        _isCheck = false;
      });
    } finally {
      setState(() {
        _isLoding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'عرض البيانات',
            ),
            _isLoding
                ? SizedBox(height: size.height, child: ShowSktolin(size: size))
                : SizedBox(
                    height: size.height / 1.5,
                    child: _isCheck
                        ? PassportDetails(filterData: _resonseData!, size: size)
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
          ],
        ),
      ),
    );
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
