import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 17,
              spreadRadius: -20,
              color: Colors.black,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
          child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "ابحث برقم الجواز",
                  icon: const Icon(Icons.search),
                  border: InputBorder.none,
                  suffixIcon: MaterialButton(
                    onPressed: () {},
                    child: ProgressButton.icon(
                        iconedButtons: {
                          ButtonState.idle: IconedButton(
                              text: 'Send',
                              icon: const Icon(Icons.send, color: Colors.white),
                              color: Colors.deepPurple.shade500),
                          ButtonState.loading: IconedButton(
                              text: 'Loading',
                              color: Colors.deepPurple.shade700),
                          ButtonState.fail: IconedButton(
                              text: 'Failed',
                              icon: const Icon(Icons.cancel, color: Colors.white),
                              color: Colors.red.shade300),
                          ButtonState.success: IconedButton(
                              text: 'Success',
                              icon: const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                              color: Colors.green.shade400)
                        },
                        onPressed: onPressedIconWithText,
                        state: stateTextWithIcon),
                  ))),
        ),
        // child: ProgressButton.icon(iconedButtons: {
        //   ButtonState.idle: IconedButton(
        //       text: 'Send',
        //       icon: Icon(Icons.send, color: Colors.white),
        //       color: Colors.deepPurple.shade500),
        //   ButtonState.loading:
        //       IconedButton(text: 'Loading', color: Colors.deepPurple.shade700),
        //   ButtonState.fail: IconedButton(
        //       text: 'Failed',
        //       icon: Icon(Icons.cancel, color: Colors.white),
        //       color: Colors.red.shade300),
        //   ButtonState.success: IconedButton(
        //       text: 'Success',
        //       icon: Icon(
        //         Icons.check_circle,
        //         color: Colors.white,
        //       ),
        //       color: Colors.green.shade400)
        // }, onPressed: onPressedIconWithText, state: stateTextWithIcon),
      ),
    );
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(
              () {
                stateTextWithIcon = Random.secure().nextBool()
                    ? ButtonState.success
                    : ButtonState.fail;
              },
            );
          },
        );

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(
      () {
        stateTextWithIcon = stateTextWithIcon;
      },
    );
  }
}
