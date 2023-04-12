import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yah_app/styles/myprovider.dart';

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

class passbord {
  final String numberPassbord;
  final String state;
  final String name;
  final String phone;
  final String another;
  final String image;
  passbord(
      {required this.numberPassbord,
      required this.state,
      required this.name,
      required this.phone,
      required this.another,
      required this.image});
}

class passpordProvider with ChangeNotifier {
  Future<void> fectData() async {
    final url = Uri.parse(
        "https://alkayantravel-a1c6e-default-rtdb.firebaseio.com/customer.json");

    try {
      final http.Response res = await http.get(url);
      // print(json.decode(res.body));
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      extractedData.forEach((clintID, clintData) {
        listClint.add(
          passbord(
              numberPassbord: clintData['passbord'].toString(),
              state: clintData['stateTransaction'],
              name: clintData['name'],
              phone: clintData['phone'].toString(),
              another: clintData['Note'],
              image: clintData['stateTransaction']),
        );
      });
      print(json.decode(res.body));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<passbord> listClint = [];

  List<passbord> listData = [
    passbord(
        numberPassbord: "123456789",
        state: "المعامله جاهزه",
        name: "احمد علي قاسم",
        phone: "777777777",
        another: "المعامله في السفاره  في حال وصولها ستصلك رساله نصيه",
        image: "assest/image/me.jpg"),
    passbord(
        numberPassbord: "1111111111",
        state: "المعامله مازالت في السفاره",
        name: "يوسف عبدالملك حاجب",
        phone: "777777777",
        another: "المعامله في السفاره  في حال وصولها ستصلك رساله نصيه",
        image: "assest/image/me.jpg"),
  ];

  bool searchList(String searchNumber) {
    for (var item in listClint) {
      if (item.numberPassbord == searchNumber) {
        return true;
      }
    }
    return false;
  }

  void setNumberPassbord(String val) {
    notifyListeners();
    numberPass = val;
  }

  String getNumberPassbord() {
    return numberPass;
  }

  String numberPass = "";
  // void checking(){
  //   if()
  // }
}
