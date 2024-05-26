import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer.rectangular({
    required this.height,
    super.key,
    this.width = double.infinity,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  const CustomShimmer.circular({
    required this.height,
    super.key,
    this.width = double.infinity,
    this.shapeBorder = const CircleBorder(),
  });
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: context.buttonColor.withOpacity(0.03),
        highlightColor: context.buttonColor.withOpacity(0.4),
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: context.buttonColor.withOpacity(0.3),
            shape: shapeBorder,
          ),
        ),
      );
}
