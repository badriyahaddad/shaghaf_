import 'package:flutter/material.dart';

import '../../helpers/const.dart';

// ignore: must_be_immutable
class IconWidget extends StatefulWidget {
  IconWidget({
    super.key,
    required this.icon,
    required this.isAppbar,
    required this.isSize,
    required this.onClick,
    required this.isFave,
  });
  final IconData icon;
  final bool isAppbar;
  final double isSize;
  final Function onClick;
  bool isFave;
  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isFave = !widget.isFave;
        widget.onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isAppbar
              ? const Color.fromARGB(120, 255, 255, 255)
              : const Color.fromARGB(141, 255, 255, 255),
          // shape: widget.isAppbar ? BoxShape.circle : BoxShape.rectangle,
          border: Border.all(
              color: widget.isAppbar
                  ? const Color.fromARGB(0, 255, 255, 255)
                  : mainColor,
              width: 0.6),
          borderRadius: widget.isAppbar
              ? BorderRadius.circular(100)
              : BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            widget.icon,
            size: widget.isSize,
            color: widget.isAppbar
                ? (widget.isFave ? Colors.red : Colors.white)
                : mainColor,
          ),
        ),
      ),
    );
  }
}
