import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  LoadingSpinner.circle({
    super.key,
    double size = 32,
    double strokeWidth = 4,
    this.color,
  })  : size = Size.square(size),
        child = Platform.isMacOS || Platform.isIOS
            ? CupertinoActivityIndicator(
                color: color,
                radius: size,
              )
            : CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color?>(color),
                strokeWidth: strokeWidth,
              );

  final Color? color;
  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      SizedBox.fromSize(size: size, child: child);
}
