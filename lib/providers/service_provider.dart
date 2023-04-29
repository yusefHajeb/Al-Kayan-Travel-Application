import 'package:flutter/material.dart';
import 'package:yah_app/screen/servis/widget/scale_transition.dart';

import '../screen/servis/sirvec_page.dart';

class DataService {
  final String title;
  final String imgUrl;
  final String paragraph;

  DataService(
      {required this.title, required this.imgUrl, required this.paragraph});
}

class ProviderShowService with ChangeNotifier {
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
    Navigator.pushReplacement(ctx, ScaleTransitionScreen2(PageService()));
  }
}
