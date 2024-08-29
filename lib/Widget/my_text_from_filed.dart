import 'package:flutter/material.dart';

import '../styles/style.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.hint,
    this.initialValue,
    this.icon,
    this.keyBoardType = TextInputType.text,
    this.onChange,
    this.validator,
    this.onSaved,
    this.onTap,
    this.controller,
    this.autovalidateMode,
    this.focusColor = primary,
    this.blurrColor = Colors.grey,
    this.isPassword = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.raduis = 10.0,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.all(15), // زيادة padding
  }) : super(key: key);

  final TextInputType keyBoardType;
  final String? hint;
  final String? initialValue;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final IconData? icon;
  final Color focusColor, blurrColor;
  final bool isPassword, readOnly, autoFocus;
  final double raduis;
  final int maxLines;
  final void Function()? onTap;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: isPassword,
      onChanged: onChange,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      readOnly: readOnly,
      autofocus: autoFocus,
      onTap: onTap,
      textAlign: TextAlign.start,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        hintStyle: fieldStyle,
        prefixIcon: icon != null ? Icon(icon, color: Colors.black45) : null,
        hintText: hint,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis),
          borderSide: BorderSide(color: blurrColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blurrColor, width: 1),
          borderRadius: BorderRadius.circular(raduis),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusColor, width: 2),
          borderRadius: BorderRadius.circular(raduis),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(raduis),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
    );
  }
}
