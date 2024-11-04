import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class AdsProvider with ChangeNotifier {
  File? _imageAdFile;
  TextEditingController get adsName => _adsName;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isValidatorKeyFormAndImagePath = false;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final TextEditingController _adsName = TextEditingController();

  File? get imageAd => _imageAdFile;

  Future<void> pickAdImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _imageAdFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  void removeAdImage() {
    _imageAdFile = null;
    notifyListeners();
  }

  Future<void> pushAdToFirebase() async {
    isLoading = true;
    try {
      final ref =
          FirebaseFirestore.instance.collection('Bouncing Scroll').doc();

      final _storage = FirebaseStorage.instance;

      final imageRef =
          _storage.ref("customer/${path.basename(_imageAdFile!.path)}");
      await imageRef.putFile(_imageAdFile!).then((taskSnapshot) async {
        final imageUrl = await taskSnapshot.ref.getDownloadURL();
        await ref.set({'adsName': _adsName.text, 'imageUrl': imageUrl});
        _adsName.clear();
        // removeAdImage();
      });
    } on FirebaseException catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
    }
  }

  bool get validatorFormAndImagePath => _isValidatorKeyFormAndImagePath;
  bool validateFormAndImage() {
    _isValidatorKeyFormAndImagePath =
        (_formKey.currentState?.validate() ?? false) &&
            (_imageAdFile?.path != null);
    notifyListeners();
    return _isValidatorKeyFormAndImagePath;
  }
}
