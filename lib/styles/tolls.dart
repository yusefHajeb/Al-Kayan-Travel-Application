import 'package:flutter/material.dart';

// import 'package:yah_app/screen/kaian_screen.dart';
const secanderyColor = Color.fromARGB(255, 212, 152, 0);
const primary = Color.fromARGB(255, 237, 180, 38);
const yBackgroundColor = Color.fromARGB(255, 255, 255, 255);
// const kActiveIconColor = Color(0x1abc9c);
const ktextColor = Color.fromARGB(255, 60, 55, 50);
// const kBlueLightColor = Color(0xffc788f5);
// const kBlueColor = Color(0xff817Dc0);
const yShadowColor = Color(0xFFe6e6e6);
const bBackDark = Color.fromARGB(255, 84, 58, 12);
const purple2 = Color.fromARGB(255, 255, 170, 0);
const blue = Color.fromARGB(255, 251, 212, 169);
Color navy = Color(0xff0f0434);

TextStyle stl =
    TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);

class DataModel {
  final String title;
  final String imageName;
  final double price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel("Short Dress", "assest/image/alkian.PNG", 300.8),
  DataModel("Office Formals", "assest/image/me.jpg", 245.2),
  DataModel("Casual Jeans", "assest/image/airplane2.jpg", 168.2),
  DataModel("Jeans Skirt", "assest/image/me.jpg", 136.7),
];
