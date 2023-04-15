import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';

import '../../helpers/const.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.nextIcon,
      required this.isLogOutCard,
      required this.iconBehavior});
  final Widget icon;
  final String title;
  final Widget nextIcon;
  final bool isLogOutCard;
  final Function iconBehavior;
  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: size.width,
        height: size.width / 6,
        decoration: BoxDecoration(
            color: themeListener.isDark ? cardColorDark : cardColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    iconSize: 33,
                    icon: widget.icon,
                    onPressed: () {},
                    color: themeListener.isDark
                        ? (widget.isLogOutCard ? errorDark : titleTextColorDark)
                        : (widget.isLogOutCard ? error : titleTextColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: themeListener.isDark
                            ? (widget.isLogOutCard
                                ? errorDark
                                : titleTextColorDark)
                            : (widget.isLogOutCard ? error : titleTextColor),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            IconButton(
                iconSize: 33,
                icon: widget.nextIcon,
                onPressed: () {
                  widget.iconBehavior();
                },
                color: themeListener.isDark
                    ? (widget.isLogOutCard ? errorDark : titleTextColorDark)
                    : (widget.isLogOutCard ? error : titleTextColor)),
          ],
        ),
      ),
    );
  }
}
