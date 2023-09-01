import 'package:flutter/material.dart';
import 'package:yah_app/styles/style.dart';

import '../loading_show/sktolin_loding.dart';

class LoadingShowService extends StatelessWidget {
  const LoadingShowService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Skelton(
          height: 120,
          width: 120,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Skelton(width: 80),
            const SizedBox(height: 8),
            const Skelton(),
            const SizedBox(height: 8),
            const Skelton(),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(child: Skelton()),
                SizedBox(
                  width: 16,
                ),
                Expanded(child: Skelton()),
              ],
            )
          ],
        ))
      ],
    );
  }
}

class myAppBarServece extends StatelessWidget {
  const myAppBarServece({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assest/image/top_background.png",
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: 80,
          right: 150,
          child: Text(
            "لماذا نحن",
            style: header,
          ),
        ),
      ],
    );
  }
}
