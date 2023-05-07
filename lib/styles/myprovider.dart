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
    Product("assest/image/imageKaian.png", 'دقة في المواعيد ',
        "سرعة في انجاز المعاملات"),
    Product(
        "assest/image/imageKaian.png", 'سرعة في انجاز المعاملات', " تاشيرات مضمونه  "),
    Product(
        "assest/image/thim2.png", 'الكيان الدولي',  ""),
  ];

  //القائمة هذي حق شركائنا
  List partners = [
    Product("assest/image/imageKaian.png", 'طيران السعيدة', ""),
    Product("assest/image/imageKaian.png", 'مصر للطيران', ""),
    Product(
        "assest/image/imageKaian.png", 'دقة في المواعيد ', ""),
    Product("assest/image/imageKaian.png", 'معتمدون من السفارة السعودية', ""),
    Product(
        "assest/image/imageKaian.png", 'معتمدون من السفارة السعودية', ""),
  ];

  // فروعنا
  List branch = [
    Product("assest/image/thim3.png", 'محافظة إب ', " شارع العدين _ نزلة شركة سبافون"),
   
    Product(
        "assest/image/thim3.png", 'محافظة صنعاء  ', "قريبا "),
    Product("assest/image/thim3.png", ' محافظة عدن ', "قريباّ"),
    Product(
        "assest/image/thim3.png", ' محافظة تعز ', "قريباّ"),
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
    if (getIndex() == "0")
      return products;
    else if (getIndex() == "1"){
return partners;
 print("XXXXXXXXXXXXXXXX");
    }
      
    else if (getIndex() == "2")
      return branch;
    else
      // index = "1";
      // print(getIndex());
      return products;
  }
}