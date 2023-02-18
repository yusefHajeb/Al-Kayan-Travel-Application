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
            suffixIcon: MaterialButton(
              onPressed: () {},
              child: SliderButton(
                action: () {
                  ///Do something here
                },
                label: Text(
                  'Slide to cancel Event',
                  style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                icon: Text(
                  'x',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                  ),
                ),
                buttonColor: Colors.black,
              ),
            ),
          )),
    )));
  }
}
