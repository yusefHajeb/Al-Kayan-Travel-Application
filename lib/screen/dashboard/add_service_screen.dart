import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/home_screen/mysnackbar.dart';
import 'package:yah_app/Widget/my_text_from_filed.dart';
import 'package:yah_app/providers/form_provider.dart';
import 'package:yah_app/styles/style.dart';

import '../../Widget/my_button.dart';

class AddServiceTab extends StatelessWidget {
  const AddServiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FormProvider>(builder: (context, formProvider, child) {
        return formProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Form(
                  key: formProvider.formServiceKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                        controller: formProvider.serviceNameController,
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
                      MyTextFormField(
                        controller: formProvider.serviceDescribtionController,
                        hint: 'وصف الخدمة ',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال وصف الخدمة';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      stackChooseImage(formProvider),
                      const SizedBox(height: 15),
                      MyButton(
                        onPressed: () {
                          formProvider.validateAddService();
                          if (formProvider.isValid &&
                              formProvider.imageService?.path != null) {
                            formProvider.sendServiceDataToFirestore(
                                FirebaseFirestore.instance
                                    .collection('Customers')
                                    .doc());
                          } else {
                            mySnackBar(ScaffoldMessenger.of(context),
                                'يرجى اختيار صورة الخدمة');
                          }
                        },
                        buttonName: 'إضافة',
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  Widget stackChooseImage(FormProvider formProvider) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            await formProvider.pickImageService(ImageSource.gallery);
          },
          child: Center(
            child: formProvider.imageService?.path != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Image.file(
                        fit: BoxFit.cover,
                        height: 300,
                        File(formProvider.imageService?.path ?? '')),
                  )
                : const Text('أضف صورة الخدمة', style: fieldStyle),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: formProvider.imageService?.path != null
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
                    formProvider.removeImage();
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ))
              : const SizedBox(),
        )
      ],
    );
  }
}
