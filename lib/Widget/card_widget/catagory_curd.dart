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
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          margin: const EdgeInsets.only(left: 10, bottom: 20),
          width: size.width / 3,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              )
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
            ),
          ),
        ),
      ),
    );
  }
}
