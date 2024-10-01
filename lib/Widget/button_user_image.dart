import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yah_app/providers/form_provider.dart';
import 'package:yah_app/styles/style.dart';

class ButtonChooseImage extends StatelessWidget {
  const ButtonChooseImage({
    super.key,
    required this.provider,
  });

  final FormProvider provider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            await provider.pickImage(ImageSource.gallery);
          },
          child: Center(
            child: provider.imageFile?.path != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Image.file(
                        fit: BoxFit.cover,
                        height: 300,
                        File(provider.imageFile?.path ?? '')),
                  )
                : const Text('أضف صورة', style: card),
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
    );
  }
}
