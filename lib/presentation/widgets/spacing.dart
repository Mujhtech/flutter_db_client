import 'package:flutter/material.dart';

class Height3 extends StatelessWidget {
  const Height3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 3);
  }
}

class Height5 extends StatelessWidget {
  const Height5({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 5);
  }
}

class Height10 extends StatelessWidget {
  const Height10({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class Height15 extends StatelessWidget {
  const Height15({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15);
  }
}

class Height20 extends StatelessWidget {
  const Height20({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}

class Height30 extends StatelessWidget {
  const Height30({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 30);
  }
}

class CustomHeight extends StatelessWidget {
  const CustomHeight({super.key, this.height = 30});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

// Width Spacers
class Width3 extends StatelessWidget {
  const Width3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 3);
  }
}

class Width5 extends StatelessWidget {
  const Width5({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 5);
  }
}

class Width10 extends StatelessWidget {
  const Width10({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 10);
  }
}

class Width15 extends StatelessWidget {
  const Width15({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 15);
  }
}

class Width20 extends StatelessWidget {
  const Width20({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 20);
  }
}

class CustomWidth extends StatelessWidget {
  const CustomWidth({super.key, this.width = 30});
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
