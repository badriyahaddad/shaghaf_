import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.hilighColor,
      required this.baseColor});
  final double width;
  final double height;
  final double radius;
  final Color hilighColor;
  final Color baseColor;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,
      baseColor: baseColor,
      highlightColor: hilighColor,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color.fromARGB(213, 49, 49, 49),
            borderRadius: BorderRadius.circular(radius),
          )),
    );
  }
}
