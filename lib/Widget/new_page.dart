import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader2 extends StatefulWidget {
  const MyHeader2({Key? key}) : super(key: key);

  @override
  State<MyHeader2> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader2> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
            ),
            // image: DecorationImage(
            //   image: AssetImage("assets/images/virus.png"),
            // ),
          ),
          child: Text(""),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
