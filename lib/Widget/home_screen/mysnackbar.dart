import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yah_app/styles/style.dart';

void mySnackBar(ScaffoldMessengerState scaffold, String message) {
  scaffold.showSnackBar(SnackBar(
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 47,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "خطاء",
                      style: header2,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text(
                      message,
                      style: paragraph,
                    ),
                    // myBilder(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assest/image/svg/bubbles.svg",
              height: 60,
              width: 48,
              color: const Color.fromARGB(255, 212, 152, 0),
            ),
          ),
        ),
        Positioned(
          top: -15,
          right: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assest/image/svg/fail.svg",
                height: 40,
                color: bBackDark,
              ),
              InkWell(
                onTap: () => scaffold.hideCurrentSnackBar(),
                child: SvgPicture.asset(
                  "assest/image/svg/close.svg",
                  height: 18,
                  color: const Color.fromARGB(255, 212, 152, 0),
                ),
              ),
            ],
          ),
        ),
        //svg
      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}
