import 'package:flutter/material.dart';

class HyperLink extends StatelessWidget {
  const HyperLink({required this.child, required this.onTap, super.key});
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: child,
      ),
    );
  }
}
