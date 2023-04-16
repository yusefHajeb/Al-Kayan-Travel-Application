import 'package:flutter/material.dart';

class Product {
  final image;
  final name;
  final discrib;
  Product(this.image, this.name, this.discrib);
}

class ProviderService with ChangeNotifier {
  List<String> titleTopScreen = ["لماذا كيان", "شركائنا", "الفروع"];

  List products = [
    Product("assest/image/imageKaian.png", 'مصداقية', "دائما الزبون على حق"),
    Product("assest/image/imageKaian.png", 'اسعار منافسة',
        "خدمات متعددة بااسعار منافسة"),
    Product("assest/image/thim3.png", 'دقة في المواعيد ',
        "سرعة في انجاز المعاملات"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
  ];

  //اقائمة هذي حق شركائنا
  List partners = [
    Product("assest/image/me.jpg", 'طيران السعيدة', "دائما الزبون على حق"),
    Product("assest/image/me.jpg", 'مصر للطيران', ""),
    Product(
        "assest/image/me.jpg", 'دقة في المواعيد ', "سرعة في انجاز المعاملات"),
    Product("assest/image/me.jpg", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
  ];

  // فروعنا
  List branch = [
    Product("assest/image/thim3.png", 'طيران السعيدة', "دائما الزبون على حق"),
    Product("assest/image/thim3.png", 'مصر للطيران', ""),
    Product(
        "assest/image/me.jpg", 'دقة في المواعيد ', "سرعة في انجاز المعاملات"),
    Product("assest/image/me.jpg", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
    Product(
        "assest/image/thim2.png", 'معتمدون من السفارة السعودية', "سييبشسيبش"),
  ];

  void setIndex(String val) {
    // notifyListeners();
    index = val;
  }

  void setNumberScreen(String val) {
    notifyListeners();
    indexScreen = val;
  }

  String getNumberScreen() {
    return indexScreen;
  }

  String getIndex() {
    return index;
  }

  String indexScreen = "0";
  String index = "0";
  List<dynamic> check() {
    if (getIndex() == "1")
      return products;
    else if (getIndex() == "2")
      return partners;
    else if (getIndex() == "3")
      return branch;
    else
      // index = "1";
      // print(getIndex());
      return products;
  }
}
