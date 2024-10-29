import 'package:flutter/material.dart';

import '../../styles/style.dart';

class CategoryCount extends StatelessWidget {
  final String titleCurd;
  final Icon myIcon;
  final Function press;
  const CategoryCount({
    Key? key,
    required this.titleCurd,
    required this.myIcon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        width: size.width / 3,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: SizedBox(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  myIcon,
                  const SizedBox(
                    height: 10,
                  ),
                  Text(titleCurd,
                      textAlign: TextAlign.center,
                      style: paragraph.copyWith(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                ]),
          ),
        ),
      ),
    );
  }
}
