import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shaghaf/screens/sub_screens/add_form_artwork_screen.dart';

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
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddFormArtworkScreen()));
      },
      child: Icon(
        Icons.add,
        color: themeListener.isDark ? backgroundColorDark : backgroundColor,
      ),
    );
  }
}
