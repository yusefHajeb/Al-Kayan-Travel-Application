import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yah_app/Widget/home_screen/mysnackbar.dart';
import 'package:yah_app/Widget/kayancontent/appbar_contant.dart';
import 'package:yah_app/Widget/my_dropdown_field.dart';
import 'package:yah_app/Widget/my_text_from_filed.dart';
import 'package:yah_app/providers/form_provider.dart';

import '../../Widget/button_user_image.dart';
import '../../Widget/my_button.dart';

class UserDetAddUserPassportScreen extends StatelessWidget {
  const UserDetAddUserPassportScreen({super.key});

  static const String routeName = '/add-service';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    return Scaffold(
        body: Consumer<FormProvider>(builder: (context, formProvider, child) {
      return formProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const AppBarHeader(title: "إضافة مستخدم جديد"),
                Expanded(
                  child: Form(
                    key: provider.formKey,
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        // const AppBarHeader(title: "إضافة مستخدم جديد"),
                        MyTextFormField(
                          controller: provider.numberPassportController,
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
                        ButtonChooseImage(provider: provider),
                        const SizedBox(height: 15),
                        MyButton(
                          onPressed: () {
                            provider.validate();
                            if (provider.isValid &&
                                provider.imageFile?.path != null) {
                              provider.sendPasspoardDataToFirestore(
                                  FirebaseFirestore.instance
                                      .collection('Customers')
                                      .doc());
                            } else {
                              mySnackBar(ScaffoldMessenger.of(context),
                                  'يرجى اختيار صوره للجواز');
                            }
                          },
                          buttonName: 'إضافة',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
    }));
  }
}
