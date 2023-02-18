import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          width: 400,
          margin: EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 17,
              spreadRadius: -20,
              color: Colors.black,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "ابحث برقم الجواز",
              icon: Icon(Icons.search),
              border: InputBorder.none,
              suffixIcon: SliderButton(
                action: () {
                  ///Do something here
                },
                width: 150,
                label: Text(
                  'search',
                  style: TextStyle(
                      color: Color.fromARGB(255, 215, 181, 181),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                icon: CircleAvatar(
                  // child: Icon(Icons.search),
                  maxRadius: 59,
                  backgroundColor: Colors.black12,
                ),
                // Icon(Icons.search),
              ),
            ),
          )),
    ));
  }
}
