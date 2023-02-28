import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yah_app/screen/kaian__screen.dart';

class ScreenDataSelect extends StatefulWidget {
  const ScreenDataSelect({Key? key}) : super(key: key);

  @override
  State<ScreenDataSelect> createState() => _ScreenDataSelectState();
}

List dataCustomer = [
  DataCostumer("assest/image/14_No Search Results.png",
      "Yousef abdu Almalik hajeb", 24434, "Jahez", DateTime.now().toString()),
  DataCostumer("assest/image/14_No Search Results.png",
      "Yousef abd Almalik hajeb", 24434, "Jahez", DateTime.now().toString()),
  DataCostumer("assest/image/14_No Search Results.png",
      "Yousef abd Almalik hajeb", 24434, "Jahez", DateTime.now().toString()),
];
int check = 0;

class _ScreenDataSelectState extends State<ScreenDataSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: dataCustomer.map((e) => Container()).toList(),
      ),
    );
  }
}

// ignore: camel_case_types
class DataCostumer {
  String ImageCustomer;
  String nameCustomer;
  int numberPass;
  String? statePapp;
  String? checkPass;
  DataCostumer(this.ImageCustomer, this.nameCustomer, this.numberPass,
      this.statePapp, this.checkPass);
}
