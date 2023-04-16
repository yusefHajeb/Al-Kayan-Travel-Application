import 'package:flutter/material.dart';

TextStyle stl =
    TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);

class DataModel {
  final String imageName;

  DataModel(
    this.imageName,
  );
}

List<DataModel> dataList = [
  DataModel("assest/image/alkian.PNG"),
  DataModel("assest/image/me.jpg"),
  DataModel("assest/image/airplane2.jpg"),
  DataModel("assest/image/me.jpg"),
];
