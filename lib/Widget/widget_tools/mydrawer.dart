// import 'dart:html';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yah_app/styles/style.dart';
import 'package:yah_app/styles/tolls.dart';

class ScreenMedia extends StatelessWidget {
  @override
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
                    child: Container(
                      child: Image.asset(
                        "assest/icon/icons8-instagram-64.png",
                        fit: BoxFit.fill,
                      ),
                      margin: EdgeInsets.only(
                          bottom: _w / 30, left: _w / 60, right: _w / 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
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

class CardNew extends StatelessWidget {
  // const CardNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: navy,
      body: Container(
          height: 300,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Row(
            // scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            children: [
              SizedBox(
                width: 16,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                          colors: [blue, purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("لماذا الكيان"),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                          colors: [blue, purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("لماذا الكيان"),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                          colors: [blue, purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("لماذا الكيان"),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          )),
    );
  }
}
