import 'package:flutter/material.dart';
import 'package:yah_app/styles/style.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.buttonName,
    this.onPressed,
    this.shadowColor = ktextColor,
    this.backgroundColor = primary,
  });
  final Color? shadowColor;
  final Function()? onPressed;
  final Color? backgroundColor;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(side: BorderSide(color: backgroundColor!)),
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(10),
        elevation: 4,
        shadowColor: shadowColor,
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(10),
        foregroundColor: Colors.white,
        side: BorderSide(color: backgroundColor!),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
        // padding: const EdgeInsets.all(10),
      ),
      onPressed: onPressed,
      child: Center(child: Text(buttonName, style: header2)),
    );
  }
}
