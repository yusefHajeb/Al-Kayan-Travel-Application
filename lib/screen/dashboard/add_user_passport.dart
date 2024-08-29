import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/my_dropdown_field.dart';
import 'package:yah_app/Widget/my_text_from_filed.dart';
import 'package:yah_app/providers/dashboard_provider.dart';
import 'package:yah_app/providers/form_provider.dart';
import 'package:yah_app/styles/style.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  static const String routeName = '/add-service';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    return Scaffold(body:
        Consumer<DashboardProvider>(builder: (context, formProvider, child) {
      return formProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: provider.formKey,
                child: ListView(
                  children: [
                    MyTextFormField(
                      controller: provider.numberPassboardController,
                      hint: 'رقم الجواز',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم الجواز';
                        }
                        if (value.length < 6) {
                          return 'الرجاء إدخال رقم جواز صحيح';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    MyTextFormField(
                      controller: provider.nameUserController,
                      hint: 'إسم المستخدم',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال أسم المستخدم';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    MyTextFormField(
                      controller: provider.phoneUserController,
                      hint: 'رقم الهاتف',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم الهاتف';
                        }
                        if (value.length < 9) {
                          return 'الرجاء إدخال رقم هاتف صحيح';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    MyDropdownButtonFormField(
                      onChange: (value) {
                        if (value != null) {
                          provider.setStatusTrans(value);
                        }
                      },
                      items: const ['عمرة', 'زيارة', 'حج', 'سكن', 'تاشيرة'],
                      hint: 'نوع المعاملة',
                      value: 'عمرة',
                      available: true,
                      fillColor: Colors.white,
                      blurrBorderColor: Colors.grey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء أختيار نوع المعاملة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // height: 150,
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await provider.pickImage(ImageSource.gallery);
                          },
                          child: Center(
                            child: provider.imageFile?.path != null
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18)),
                                    child: Image.file(
                                        fit: BoxFit.cover,
                                        height: 300,
                                        File(provider.imageFile?.path ?? '')),
                                  )
                                : const Text('أضف صورة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: provider.imageFile?.path != null
                              ? IconButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: bBackDark,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  splashColor: Colors.blue,
                                  color: primary,
                                  focusColor: Colors.amber,
                                  onPressed: () {
                                    provider.removeImage();
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ))
                              : const SizedBox(),
                        )
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {
                        provider.validate();

                        if (provider.isValid) {
                          provider.sendDataToFirestore(FirebaseFirestore
                              .instance
                              .collection('Customers')
                              .doc());

                          // final data = provider.getFormData();
                          // print('data');
                          // print(data);
                          // Provider.of<DashboardProvider>(context,
                          //         listen: false)
                          //     .setLoading(true);
                        }
                      },
                      child: const Text('إضافة'),
                    ),
                  ],
                ),
              ),
            );
    }));
  }
}
