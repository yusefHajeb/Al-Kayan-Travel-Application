import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class FormProvider extends ChangeNotifier {
  final TextEditingController _passboardController = TextEditingController();
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _phoneCustomerController =
      TextEditingController();
  final TextEditingController _anotherNoteController = TextEditingController();
  String? _statusTrans;
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get numberPassboardController => _passboardController;
  TextEditingController get nameUserController => _customerController;
  TextEditingController get phoneUserController => _phoneCustomerController;
  TextEditingController get anotherUserController => _anotherNoteController;
  File? _imageFile;
  String? _uploadedImageUrl;

  File? get imageFile => _imageFile;
  String? get uploadedImageUrl => _uploadedImageUrl;

  void setStatusTrans(String val) {
    _statusTrans = val;
  }

  Future<void> pickImage(ImageSource source) async {
    print('[-]');
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      print('status ============== ${e.toString()}');
    }
  }

  @override
  void dispose() {
    _passboardController.dispose();
    _customerController.dispose();
    _phoneCustomerController.dispose();
    _anotherNoteController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool _isValid = false;
  bool get isValid => _isValid;

  void validate() {
    _isValid = _formKey.currentState?.validate() ?? false;
    notifyListeners();
  }

  void removeImage() {
    _imageFile = null;
    notifyListeners();
  }

  Map<String, String> getFormData(String imageUrl) {
    return {
      'numPassport': _passboardController.text,
      'NameCust': _customerController.text,
      "ImageTrans": imageUrl,
      "numberPhone": _phoneCustomerController.text,
      'NumberTrans': '98',
      "StatusTrans": 'جار المعاملة',
      "TypeTrans": _statusTrans ?? '',
    };
  }

  Future<void> sendDataToFirestore(DocumentReference docRef) async {
    try {
      print('upload data');
      final _storage = FirebaseStorage.instance;
      final imageRef =
          _storage.ref(("customer/${path.basename(_imageFile!.path)}"));
      await imageRef.putFile(_imageFile!);
      _uploadedImageUrl = await imageRef.getDownloadURL();
      print(_uploadedImageUrl.toString());
      await docRef.set(getFormData(_uploadedImageUrl ?? ''));
    } on FirebaseException catch (e) {
      print('Error sending data: =================${e.toString()}');
    }
  }
}
