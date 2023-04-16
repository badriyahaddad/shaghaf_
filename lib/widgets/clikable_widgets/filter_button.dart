import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key,
      required this.isSelected,
      required this.onClick,
      required this.btnTitle});
  final bool isSelected;
  final Function onClick;
  final String btnTitle;
  @override
  Widget build(BuildContext context) {
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? (themeListener.isDark ? mainColorDark : mainColor)
                : (themeListener.isDark
                    ? backgroundColorDark
                    : backgroundColor),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: themeListener.isDark ? mainColorDark : mainColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Center(
              child: Text(
                btnTitle,
                style: TextStyle(
                    color: isSelected
                        ? (themeListener.isDark
                            ? backgroundColorDark
                            : backgroundColor)
                        : (themeListener.isDark
                            ? titleTextColorDark
                            : mainColor),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
