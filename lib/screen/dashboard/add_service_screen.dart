import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/home_screen/mysnackbar.dart';
import 'package:yah_app/Widget/kayancontent/appbar_contant.dart';
import 'package:yah_app/Widget/my_text_from_filed.dart';
import 'package:yah_app/providers/form_provider.dart';
import 'package:yah_app/screen/services_screen/our_service_screen.dart';
import 'package:yah_app/styles/style.dart';

import '../../Widget/my_button.dart';
import '../../providers/service_provider.dart';

class AddServiceTab extends StatelessWidget {
  const AddServiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarHeader(title: "إضافة خدمة"),
            Consumer<FormProvider>(builder: (context, formProvider, child) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Form(
                  key: formProvider.formServiceKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                        controller: formProvider.serviceNameController,
                        hint: 'إدخال اسم الخدمة',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'هذا الحقل يجب ان يحتوي على قيمة';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      MyTextFormField(
                        controller: formProvider.serviceDescriptionController,
                        hint: 'وصف الخدمة ',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال وصف الخدمة';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      stackChooseImage(formProvider, context),
                      const SizedBox(height: 15),
                      if (formProvider.isLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      formProvider.successUploadService
                          ? MyButton(
                              buttonName: 'عرض الخدمات',
                              onPressed: () {
                                Provider.of<ServicesProvider>(context,
                                        listen: false)
                                    .setValueLoading(false);
                                Navigator.pushNamed(
                                    context, OurSreviceScreen.routeName);
                              },
                            )
                          : MyButton(
                              onPressed: () {
                                formProvider.validateAddService();
                                if (formProvider.isValid &&
                                    formProvider.imageService?.path != null) {
                                  formProvider.sendServiceDataToFirestore(
                                      FirebaseFirestore.instance
                                          .collection('service')
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
          ],
        ),
      ),
    );
  }

  Widget stackChooseImage(FormProvider formProvider, BuildContext context) {
    if (formProvider.imageService?.path != null) {
      return Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          GestureDetector(
            onTap: () async {
              await formProvider.pickImageService(ImageSource.gallery);
            },
            child: Center(
                child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: Image.file(
                  fit: BoxFit.cover,
                  height: 300,
                  File(formProvider.imageService?.path ?? '')),
            )),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: IconButton(
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
                  )))
        ],
      );
    } else {
      return MyTextFormField(
          focusColor: Colors.grey,
          icon: Icons.image,
          hint: 'إختيار صورة للخدمة',
          readOnly: true,
          onTap: () async {
            final source = await showDialog<ImageSource>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'اختر مصدر الصورة',
                  style: header2,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, ImageSource.camera);
                    },
                    child: const Text(
                      'الكاميرا',
                      style: fieldStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, ImageSource.gallery);
                    },
                    child: const Text(
                      'المعرض',
                      style: fieldStyle,
                    ),
                  ),
                ],
              ),
            );
            if (source != null) {
              await formProvider.pickImageService(source);
            }
          });
    }
  }
}
