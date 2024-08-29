import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'provider_passboard.dart';

class DashboardProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final _firestore = FirebaseFirestore.instance;
  Future<void> uploadUserData(Passbord passbord) async {
    try {
      setLoading(true);
      final userRef = _firestore.collection('Customers').doc();

      await userRef.set(passbord.toMap());
    } catch (e) {
      print('Error uploading user data: $e');
    }
    setLoading(false);
  }
}
