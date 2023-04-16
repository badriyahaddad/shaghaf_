import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/theme_provider.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return FloatingActionButton(
      backgroundColor: themeListener.isDark ? mainColorDark : mainColor,
      onPressed: () {},
      child: Icon(
        Icons.add,
        color: themeListener.isDark ? backgroundColorDark : backgroundColor,
      ),
    );
  }
}
