import 'package:flutter/material.dart';
import '../loading_show/sktolin_loding.dart';

class LoadingShowService extends StatelessWidget {
  const LoadingShowService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Skelton(
          height: 120,
          width: 120,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Skelton(width: 80),
              SizedBox(height: 8),
              Skelton(),
              SizedBox(height: 8),
              Skelton(),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: Skelton()),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(child: Skelton()),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
