import 'package:flutter/cupertino.dart';

import 'lodaing_widget.dart';

class ShowSktolin extends StatelessWidget {
  const ShowSktolin({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Column(
              children: const [
                Skelton(
                  height: 20,
                  width: 230,
                ),
                SizedBox(
                  height: 5,
                ),
                Skelton(
                  height: 20,
                  width: 230,
                ),
              ],
            )),
            Skelton(
              height: 30,
              width: 120,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Skelton(
              width: size.width - 50,
              height: size.height / 3,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: const [
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                  ],
                )),
                Skelton(
                  height: 30,
                  width: 120,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: const [
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                  ],
                )),
                Skelton(
                  height: 30,
                  width: 120,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Column(
                  children: const [
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Skelton(
                      height: 20,
                      width: 230,
                    ),
                  ],
                )),
                Skelton(
                  height: 25,
                  width: 120,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
