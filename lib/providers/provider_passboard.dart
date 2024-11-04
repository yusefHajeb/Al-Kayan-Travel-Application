// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// final firestoreInstance = FirebaseFirestore.instance;

// import 'package:yah_app/screen/kaian_screen.dart';
class Passport {
  final String numberPassport;

  final String state;
  final String name;
  final String phone;
  final String another;
  final String image;
  Passport({
    required this.numberPassport,
    required this.state,
    required this.name,
    required this.phone,
    required this.another,
    required this.image,
  });

  Passport copyWith({
    String? numberPassport,
    String? state,
    String? name,
    String? phone,
    String? another,
    String? image,
  }) {
    return Passport(
      numberPassport: numberPassport ?? this.numberPassport,
      state: state ?? this.state,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      another: another ?? this.another,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numberPassbord': numberPassport,
      'state': state,
      'name': name,
      'phone': phone,
      'another': another,
      'image': image,
    };
  }

  factory Passport.fromMap(Map<String, dynamic> map) {
    return Passport(
      numberPassport: map['numberPassbord'] as String,
      state: map['state'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      another: map['another'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Passport.fromJson(String source) =>
      Passport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Passbord(numberPassbord: $numberPassport, state: $state, name: $name, phone: $phone, another: $another, image: $image)';
  }

  @override
  bool operator ==(covariant Passport other) {
    if (identical(this, other)) return true;

    return other.numberPassport == numberPassport &&
        other.state == state &&
        other.name == name &&
        other.phone == phone &&
        other.another == another &&
        other.image == image;
  }

  @override
  int get hashCode {
    return numberPassport.hashCode ^
        state.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        another.hashCode ^
        image.hashCode;
  }
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
          filterData = Passport(
              numberPassport: clintData['Passbord'].toString(),
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
  void setFilterData(Passport pass) {
    filterData = pass;
    notifyListeners();
  }

  Passport getPasspordVar() {
    return filterData;
  }

  List<Passport> listClint = [];

  List<Passport> listData = [];

  bool searchList(String searchNumber) {
    for (var item in listClint) {
      if (item.numberPassport == searchNumber) {
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
