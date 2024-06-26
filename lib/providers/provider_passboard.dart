import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// final firestoreInstance = FirebaseFirestore.instance;

// import 'package:yah_app/screen/kaian_screen.dart';
class Passbord {
  final String numberPassbord;

  final String state;
  final String name;
  final String phone;
  final String another;
  final String image;
  Passbord(
      {required this.numberPassbord,
      required this.state,
      required this.name,
      required this.phone,
      required this.another,
      required this.image});
}

class PassportProvider with ChangeNotifier {
  // Future<void> fetchDataCliud() async {
  //   firestoreInstance
  //       .collection("users")
  //       .add({"username": "Flutter", "email": "flutter@example.com"});
  // }

  Future<void> fectData() async {
    final url = Uri.parse(
        "https://alkayantravel-a1c6e-default-rtdb.firebaseio.com/customer.json");
    try {
      final http.Response res = await http.get(url);
      // print(json.decode(res.body));
      final extractedData = json.decode(res.body) as Map<String, dynamic>;

      extractedData.forEach((clintID, clintData) {
        if (clintData['Passbord'].toString() == getNumberPassbord()) {
          filterData = Passbord(
              numberPassbord: clintData['Passbord'].toString(),
              state: clintData['stateTransaction'],
              name: clintData['name'],
              phone: clintData['phone'].toString(),
              another: clintData['Note'],
              image: clintData['stateTransaction']);
          existPass = true;
          print(
            "data fetching " + clintData['Passbord'].toString(),
          );
          print("-------------------------------------------------------");
        }
        print(
          "data fetching " + clintData['Passbord'].toString(),
        );
      });

      notifyListeners();
    } catch (error) {
      // throw error;
    }
  }

  bool existPass = false;

  bool getExist() {
    return existPass;
  }

  var filterData;
  void setFilterData(Passbord pass) {
    filterData = pass;
    notifyListeners();
  }

  Passbord getPasspordVar() {
    return filterData;
  }

  List<Passbord> listClint = [];

  List<Passbord> listData = [];

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
}
