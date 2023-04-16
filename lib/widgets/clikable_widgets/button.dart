import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/theme_provider.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.borderButton,
      required this.txt,
      required this.loading,
      required this.onClick,
      required this.screenWidth,
      required this.screenHieght,
      this.isActive,
      required this.color});
  final bool borderButton;
  final String txt;
  final Function onClick;
  final bool loading;
  final double screenWidth;
  final double screenHieght;
  final bool? isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
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
                        ? color
                        : isActive!
                            ? color
                            : const Color.fromARGB(0, 255, 255, 255),
                    width: 2)),
                backgroundColor: MaterialStateProperty.all(
                  borderButton
                      ? themeListener.isDark
                          ? backgroundColorDark
                          : backgroundColor
                      : isActive!
                          ? color
                          : themeListener.isDark
                              ? disaabledMainColorDark
                              : disaabledMainColor,
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
                        ? color
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
