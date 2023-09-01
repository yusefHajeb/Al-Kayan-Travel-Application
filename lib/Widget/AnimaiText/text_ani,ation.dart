import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnmi extends StatefulWidget {
  const TextAnmi({Key? key}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<TextAnmi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'اهلا وسهلا بكم ',
            speed: const Duration(milliseconds: 150),
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
        displayFullTextOnTap: true,
        stopPauseOnTap: false,
      ),
    );
  }
}
