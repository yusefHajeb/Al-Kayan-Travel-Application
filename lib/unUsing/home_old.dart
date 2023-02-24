// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yah_app/unUsing/bottomNav.dart';
import 'package:yah_app/Widget/card_widget/catagory_curd.dart';

class MyHome extends StatelessWidget {
  /// sdflsffsdf
  /// sdfsdfs
  /// dfsdf
  ///

  // Future<void> selectScreene(BuildContext ctx) async =>
  //     Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
  //       return BottomPage();
  //     }));

  int _selectedPageIndex = 0;
  void _x1(int index) {
    _selectedPageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              height: 80,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  bottomNaveItem(
                    title: "خدماتنا",
                    IconBottom: Icon(Icons.design_services_sharp),
                    Pass: () {},
                  ),
                  bottomNaveItem(
                    title: "الرئيسية",
                    IconBottom: Icon(Icons.home),
                    Pass: () {},
                  ),
                  bottomNaveItem(
                    title: "about",
                    IconBottom: Icon(Icons.arrow_back_outlined),
                    Pass: () {},
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(onTap: _x1, items: [
            //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            //   BottomNavigationBarItem(icon: Icon(Icons.help), label: "Help"),
            // ]),
            body: Stack(
              children: <Widget>[
                Container(
                  // height: 200,
                  height: size.height * .45,
                  width: double.infinity,
                  color: Color(0x1abc9c),
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Icon(Icons.menu),
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xfff2bEA1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assest/image/imageKaian.png",
                      alignment: Alignment.center,
                      color: Colors.blue,
                      width: double.infinity,
                      height: 200,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 0, right: 30, left: 30, bottom: 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5)),
                      child: TextField(
                          decoration: InputDecoration(
                        hintText: "Serch",
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      )),
                    ),
                    Container(
                      child: Expanded(
                          child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              children: <Widget>[
                            CatagoryCount(
                              titleCurd: "لماذا كيان",
                              myIcon: Icon(
                                Icons.diamond,
                                color: Colors.red,
                              ),
                              press: () {},
                            ),
                            CatagoryCount(
                              titleCurd: "حساباتنا",
                              myIcon: Icon(
                                Icons.share,
                                color: Color.fromARGB(255, 255, 29, 25),
                              ),
                              press: () {},
                            ),
                            CatagoryCount(
                                titleCurd: "خدماتنا",
                                myIcon: Icon(Icons.design_services),
                                press: () {}),
                            CatagoryCount(
                              titleCurd: "المطور",
                              myIcon: Icon(Icons.developer_board,
                                  color: Colors.blue),
                              press: () {},
                            )
                          ])),
                    ),
                  ],
                ))
              ],
            )));
  }
}

class bottomNaveItem extends StatelessWidget {
  final String title;
  final Icon IconBottom;
  final Function Pass;
  final bool isActive;
  const bottomNaveItem({
    Key? key,
    required this.title,
    required this.IconBottom,
    required this.Pass,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconBottom,
          Text(
            title,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
