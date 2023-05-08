import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  const RoundImage(
      {super.key,
      required this.provider,
      required this.height,
      required this.width});
  final ImageProvider provider;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image(
        image: provider,
        height: height,
        width: width,
      ),
    );
  }

  factory RoundImage.url(String url,
      {required double height, required double width}) {
    return RoundImage(
      height: height,
      provider: NetworkImage(url),
      width: width,
    );
  }
  factory RoundImage.memory(Uint8List data,
      {required double height, required double width}) {
    return RoundImage(
      height: height,
      provider: MemoryImage(data),
      width: width,
    );
  }
}
