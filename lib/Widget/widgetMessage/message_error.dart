import 'package:flutter/material.dart';

import '../../styles/style.dart';

class MessageShow extends StatelessWidget {
  const MessageShow({
    Key? key,
    required this.messageError,
  }) : super(key: key);

  final messageError;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Text(messageError),
            ],
          ),
        ),
      ],
    );
  }
}
