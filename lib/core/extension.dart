import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1024
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 768
                ? (md ?? sm ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }

  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: context.responsive<int>(
        2, // default
        sm: 2, // small
        md: 3, // medium
        lg: 4, // large
        xl: 5, // extra large screen
      ),
    );
  }
}
