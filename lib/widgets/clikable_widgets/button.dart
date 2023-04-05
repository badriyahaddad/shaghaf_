import 'package:flutter/material.dart';

import '../../helpers/const.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.borderButton,
      required this.txt,
      required this.loading,
      required this.onClick,
      required this.screenWidth,
      required this.screenHieght,
      this.isActive});
  final bool borderButton;
  final String txt;
  final Function onClick;
  final bool loading;
  final double screenWidth;
  final double screenHieght;
  final bool? isActive;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : SizedBox(
            width: screenWidth,
            height: screenHieght,
            child: ElevatedButton(
              onPressed: () {
                onClick();
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(
                    color: borderButton
                        ? mainColor
                        : isActive!
                            ? mainColor
                            : const Color.fromARGB(0, 255, 255, 255),
                    width: 2)),
                backgroundColor: MaterialStateProperty.all(
                  borderButton
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : isActive!
                          ? mainColor
                          : mainColor.withOpacity(0.2),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, right: 4, left: 4),
                child: Text(
                  txt,
                  style: TextStyle(
                    color: borderButton
                        ? mainColor
                        : const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
  }
}
