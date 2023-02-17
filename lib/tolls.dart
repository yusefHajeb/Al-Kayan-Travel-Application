import 'package:flutter/material.dart';
import 'package:yah_app/screen/kaian_screen.dart';

const primary = Color.fromARGB(255, 237, 180, 38);
const yBackgroundColor = Color(0xFFF8f8f8);
const kActiveIconColor = Color(0x1abc9c);
const ktextColor = Color(0xff222845);
const kBlueLightColor = Color(0xffc788f5);
const kBlueColor = Color(0xff817Dc0);
const kShadowColor = Color(0xFFe6e6e6);
const bBackDark = Color(0xff002828);
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
  DataModel("Short Dress", "assest/image/me.jpg", 300.8),
  DataModel("Office Formals", "assest/image/me.jpg", 245.2),
  DataModel("Casual Jeans", "assest/image/me.jpg", 168.2),
  DataModel("Jeans Skirt", "assest/image/me.jpg", 136.7),
];
