// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yah_app/screen/services_screen/widget/scale_transition.dart';
import '../screen/services_screen/sirvec_page.dart';

class DataService {
  final String title;
  final String imgUrl;
  final String paragraph;

  DataService(
      {required this.title, required this.imgUrl, required this.paragraph});
}

class ServicesProvider with ChangeNotifier {
  List DataProvider = [];

  List<DataService> Data = [];
  bool isLoading = false;

  void setValueLoading(bool flage) {
    notifyListeners();
    isLoading = flage;
  }

  bool getLoadinf() {
    return isLoading;
  }

  int _index = 0;
  void setIndexScreen(int x) {
    notifyListeners();
    _index = x;
  }

  int getIndex() {
    return _index;
  }

  void showService(BuildContext ctx, int index) {
    setIndexScreen(index);
    setValueLoading(false);
    Navigator.pushReplacement(ctx, ScaleTransitionScreen2(const PageService()));
  }
}
