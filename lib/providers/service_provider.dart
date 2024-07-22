// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yah_app/Widget/scale_transition.dart';
import '../screen/services_screen/content_service_screen.dart';

class DataService {
  final String title;
  final String imgUrl;
  final String paragraph;

  DataService(
      {required this.title, required this.imgUrl, required this.paragraph});
}

class ServicesProvider with ChangeNotifier {
  List responseListService = [];

  List<DataService> Data = [];
  bool isLoading = false;

  void setValueLoading(bool flage) {
    notifyListeners();
    isLoading = flage;
  }

  void setResponceServese(List list) {
    responseListService = list;
    notifyListeners();
  }

  bool getLoadinf() {
    return isLoading;
  }

  List getListReosponse() {
    return responseListService;
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
    Navigator.pushReplacement(
        ctx, ScaleTransitionScreen2(const ContentServiceScreen()));
  }
}
