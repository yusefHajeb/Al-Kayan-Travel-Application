import 'package:flutter/material.dart';
import 'package:yah_app/styles/style.dart';

class AppBarHeadder extends StatelessWidget {
  const AppBarHeadder({
    super.key,
    required this.size,
    this.title,
  });

  final Size size;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: size.height / 5.2,
        width: double.infinity,
        child: Image.asset(
          "assest/image/top_image.png",
          fit: BoxFit.fill,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      Positioned(
        top: 50,
        right: 20,
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: 30,
        child: Container(
          child: title!.isNotEmpty
              ? Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: header,
                )
              : const SizedBox(),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
        ),
      ),
    ]);
  }
}
