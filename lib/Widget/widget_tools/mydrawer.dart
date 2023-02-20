// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
