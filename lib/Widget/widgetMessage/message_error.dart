import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/style.dart';
import '../../styles/tolls.dart';

class MessageShow extends StatefulWidget {
  MessageShow({
    Key? key,
    required this.messageError,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MessageShow();
  final messageError;
}

class _MessageShow extends State<MessageShow> {
  Widget _showErrorMessage(String error) {
    return Text(error);
  }

  @override
  Widget myBilder(BuildContext context) {
    return _showErrorMessage(widget.messageError);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SnackBar(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(16),
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                  height: 48,
                  width: 48,
                  color: Color.fromARGB(255, 212, 152, 0),
                ),
              ),
            ),
            Positioned(
              top: -20,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assest/image/svg/fail.svg",
                    height: 40,
                    color: bBackDark,
                  ),
                  SvgPicture.asset(
                    "assest/image/svg/close.svg",
                    height: 15,
                    color: Color.fromARGB(255, 212, 152, 0),
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
      ),
    );

    //  Row(
    //   children: [
    //     const SizedBox(
    //       width: 47,
    //     ),
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "خطاء",
    //             style: header2,
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //           Text(messageError),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }

  // @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
}
