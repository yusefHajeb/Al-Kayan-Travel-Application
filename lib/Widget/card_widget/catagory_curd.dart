import 'package:flutter/material.dart';
import 'package:yah_app/screen/kaian__screen.dart';
import 'package:yah_app/styles/tolls.dart';

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
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          margin: EdgeInsets.only(left: 10, bottom: 20),
          width: size.width / 3,
          height: 200,
          decoration: BoxDecoration(
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
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Column(children: <Widget>[
                    Spacer(),
                    myIcon,
                    Spacer(),
                    Text(
                      titleCurd,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
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
