import 'package:flutter/material.dart';
import 'package:yah_app/styles/style.dart';

class MyDropdownButtonFormField extends StatelessWidget {
  const MyDropdownButtonFormField({
    Key? key,
    required this.onChange,
    required this.items,
    this.value,
    this.hint,
    this.focusBorderColor,
    this.blurrBorderColor,
    this.fillColor,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.available = true,
    this.raduis = 10,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15, // تقليل padding العمودي
    ),
  }) : super(key: key);

  final bool available;
  final String? hint;
  final String? value;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Color? focusBorderColor, blurrBorderColor, fillColor;
  final List<String> items;
  final Function(String?)? onChange;
  final double raduis;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: Text(hint ?? "اختر عنصرًا"),
      value: value,
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                    height: 1.5, fontSize: 16), // زيادة الارتفاع
              ),
            ),
          )
          .toList(),
      onChanged: available ? onChange : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: fillColor != null,
        fillColor: fillColor,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis),
          borderSide: BorderSide(
            color: blurrBorderColor ?? Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: blurrBorderColor ?? Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(raduis),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusBorderColor ?? primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(raduis),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(raduis),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
    );
  }
}
