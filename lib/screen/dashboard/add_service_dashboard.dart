import 'package:flutter/material.dart';
import '../../Widget/my_button.dart';
import '../../Widget/my_text_from_filed.dart';

class AdcDashboardTab extends StatelessWidget {
  const AdcDashboardTab({super.key});

  static const String routeName = '/add-adver';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          // shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          children: [
            MyTextFormField(
              hint: 'اسم الاعلان',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال اسم الاعلان';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            MyTextFormField(
              hint: 'وصف الإعلان',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال وصف الإعلان';
                }
                return null;
              },
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            MyButton(
              onPressed: () {},
              buttonName: 'إضافة',
            ),
          ],
        ),
      ),
    );
  }
}
