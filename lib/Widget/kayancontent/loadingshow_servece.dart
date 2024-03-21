import 'package:flutter/material.dart';

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

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
