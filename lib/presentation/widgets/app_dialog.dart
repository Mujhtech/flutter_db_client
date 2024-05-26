import 'package:flutter/material.dart';

class AppDialog {
  AppDialog({
    required this.context,
    required this.content,
    this.width = 80,
    this.bgColor,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    this.borderRadius = 5,
    this.barrierDismissible = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.begin,
    this.end = Offset.zero,
  });
  final Widget content;
  BuildContext context;
  final double width;
  final double borderRadius;
  final bool barrierDismissible;
  final Color? bgColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;
  final Offset? begin;
  final Offset end;
  final CrossAxisAlignment crossAxisAlignment;

  Future<T?> show<T extends Object?>() {
    return showGeneralDialog(
      context: context,
      barrierLabel: 'Barrier',
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, __, ___) {
        Widget child = Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            Container(
              width: width,
              margin: margin,
              padding: padding,
              decoration: BoxDecoration(
                color: bgColor ?? Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: content,
            ),
          ],
        );

        if (mainAxisAlignment == MainAxisAlignment.center) {
          child = Center(
            child: child,
          );
        }

        return Material(
          color: Colors.transparent,
          child: child,
        );
      },
      transitionBuilder: (_, Animation<double> anim, __, Widget child) {
        Animatable<Offset> tween;

        Animatable<Offset> setTween([double dx = 0, double dy = 0]) {
          return Tween<Offset>(begin: Offset(dx, dy), end: end)
              .chain(CurveTween(curve: Curves.ease));
        }

        tween = anim.status == AnimationStatus.reverse
            ? setTween(
                begin?.dx ?? 0,
                begin?.dx ?? -1,
              )
            : setTween(
                begin?.dx ?? 0,
                begin?.dx ?? -1,
              );

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
