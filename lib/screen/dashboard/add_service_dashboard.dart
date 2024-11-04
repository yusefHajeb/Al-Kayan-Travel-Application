import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/kayancontent/appbar_contant.dart';
import 'package:yah_app/Widget/my_text_from_filed.dart';
import '../../Widget/home_screen/mysnackbar.dart';
import '../../Widget/my_button.dart';
import '../../providers/ads_provider.dart';
import '../../styles/style.dart';

class AddAdsScreen extends StatelessWidget {
  const AddAdsScreen({super.key});

  static const String routeName = '/add-adver';

  @override
  Widget build(BuildContext context) {
    final adsProvider = Provider.of<AdsProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarHeader(title: "إضافة إعلان"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<AdsProvider>(
                  builder: (context, formProvider, child) {
                return Form(
                    key: formProvider.formKey,
                    child: Column(
                      children: [
                        MyTextFormField(
                          focusColor: Colors.grey,
                          icon: Icons.image,
                          hint: 'اختر صورة الإعلان',
                          readOnly: true,
                          onTap: () {
                            adsProvider.pickAdImage(ImageSource.gallery);
                          },
                        ),
                        const SizedBox(height: 16),
                        if (adsProvider.imageAd != null) ...[
                          ShowImageServiceSelected(adsProvider: adsProvider),
                          const SizedBox(height: 16),
                        ],
                        MyTextFormField(
                          hint: 'تفاصيل الإعلان',
                          controller: adsProvider.adsName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إدخال تفاصيل الإعلان';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        adsProvider.isLoading
                            ? const CircularProgressIndicator()
                            : MyButton(
                                onPressed: () async {
                                  if (adsProvider.validateFormAndImage()) {
                                    await adsProvider.pushAdToFirebase();
                                  } else {
                                    mySnackBar(ScaffoldMessenger.of(context),
                                        'يرجى اختيار صورة الخدمة');
                                  }
                                },
                                buttonName: 'إضافة',
                              ),
                      ],
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowImageServiceSelected extends StatelessWidget {
  const ShowImageServiceSelected({
    super.key,
    required this.adsProvider,
  });

  final AdsProvider adsProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            await adsProvider.pickAdImage(ImageSource.gallery);
          },
          child: Center(
              child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            child: Image.file(
                fit: BoxFit.cover,
                height: 300,
                File(adsProvider.imageAd?.path ?? '')),
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
                  adsProvider.removeAdImage();
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                )))
      ],
    );
  }
}
