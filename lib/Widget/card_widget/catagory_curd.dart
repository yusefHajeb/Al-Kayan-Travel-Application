import 'package:flutter/material.dart';

import '../../styles/style.dart';

class CatagoryCount extends StatelessWidget {
  final String titleCurd;
  final Icon myIcon;
  final Function press;
  const CatagoryCount({
    Key? key,
    required this.titleCurd,
    required this.myIcon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          margin: const EdgeInsets.only(left: 10, bottom: 20),
          width: size.width / 3,
<<<<<<< HEAD
          height: 250,
          decoration: BoxDecoration(
=======
          height: 200,
          decoration: const BoxDecoration(
>>>>>>> 5035911d6811ccb0c95452793424fc7bed5118b4
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 6),
                blurRadius: 17,
                spreadRadius: -6,
                color: Colors.black,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                press();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Column(children: <Widget>[
                    const Spacer(),
                    myIcon,
<<<<<<< HEAD
                    Spacer(),
                    Text(titleCurd, textAlign: TextAlign.center, style: card),
=======
                    const Spacer(),
                    Text(
                      titleCurd,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
>>>>>>> 5035911d6811ccb0c95452793424fc7bed5118b4
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
