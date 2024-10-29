import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class FormProvider extends ChangeNotifier {
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _phoneCustomerController =
      TextEditingController();
  final TextEditingController _anotherNoteController = TextEditingController();
  final TextEditingController _serviceName = TextEditingController();
  final TextEditingController _serviceDescription = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _formKeyService = GlobalKey<FormState>();
  String? _statusTrans;
  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> get formServiceKey => _formKeyService;
  TextEditingController get numberPassportController => _passportController;
  TextEditingController get nameUserController => _customerController;
  TextEditingController get phoneUserController => _phoneCustomerController;
  TextEditingController get anotherUserController => _anotherNoteController;
  TextEditingController get serviceNameController => _serviceName;
  TextEditingController get serviceDescriptionController => _serviceDescription;

  File? _imageFile;
  File? _imageServiceFile;
  String? _uploadedImageUrl;

  File? get imageFile => _imageFile;
  File? get imageService => _imageServiceFile;
  String? get uploadedImageUrl => _uploadedImageUrl;

  void setStatusTrans(String val) {
    _statusTrans = val;
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> pickImage(
    ImageSource source,
  ) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickImageService(
    ImageSource source,
  ) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _imageServiceFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _passportController.dispose();
    _customerController.dispose();
    _phoneCustomerController.dispose();
    _anotherNoteController.dispose();
    _serviceName.dispose();
    _serviceDescription.dispose();

    super.dispose();
  }

  bool _isValid = false;
  bool get isValid => _isValid;

  void validate() {
    _isValid = _formKey.currentState?.validate() ?? false;
    notifyListeners();
  }

  void validateAddService() {
    _isValid = _formKeyService.currentState?.validate() ?? false;
    notifyListeners();
  }

  void removeImage() {
    _imageFile = null;
    _imageServiceFile = null;
    notifyListeners();
  }

  Map<String, String> getFormData(String imageUrl, String id) {
    return {
      'numPassport': _passportController.text,
      'NameCust': _customerController.text,
      "ImageTrans": imageUrl,
      "numberPhone": _phoneCustomerController.text,
      'NumberTrans': _phoneCustomerController.text,
      'DocumentID': id,
      'index': '23',
      "StatusTrans": _statusTrans.toString(),
      "DateTrans": DateTime.now().toIso8601String().split('T')[0],
    };
  }

  Future<void> sendPasspoardDataToFirestore(DocumentReference docRef) async {
    setLoading(true);
    try {
      final _storage = FirebaseStorage.instance;
      final imageRef =
          _storage.ref("customer/${path.basename(_imageFile!.path)}");
      await imageRef.putFile(_imageFile!);
      _uploadedImageUrl = await imageRef.getDownloadURL();

      await docRef.set(getFormData(_uploadedImageUrl ?? '', docRef.id));
      setLoading(false);
    } on FirebaseException {
      setLoading(false);
    } catch (e) {
      setLoading(false);
    }
  }

  Future<void> sendServiceDataToFirestore(DocumentReference docRect) async {
    try {
      setLoading(true);
      final _storage = FirebaseStorage.instance;
      final imageRef =
          _storage.ref("customer/${path.basename(_imageServiceFile!.path)}");

      // رفع الصورة
      await imageRef.putFile(_imageServiceFile!);

      // الحصول على رابط الصورة
      final _uploadedImageUrl = await imageRef.getDownloadURL();

      final docRect = FirebaseFirestore.instance
          .collection('service')
          .doc(); // Automatically generates a new document ID
      // حفظ البيانات في Firestore
      await docRect.set({
        'title': _serviceName.text,
        'paragraph': _serviceDescription.text,
        'imgUrl': _uploadedImageUrl
      });

      setLoading(false);
    } catch (e) {
      setLoading(false);
    }
  }
}
