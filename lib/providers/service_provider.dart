import 'package:flutter/material.dart';

import '../screen/servis/sirvec_page.dart';

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
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (_) => PageService()));
  }
}
