import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import '../../providers/theme_provider.dart';

// ignore: must_be_immutable
class WhoAreYouCard extends StatefulWidget {
  const WhoAreYouCard({
    super.key,
    required this.image,
    required this.roleBase,
    required this.tilte,
    required this.border,
  });
  final Widget image;
  final String tilte;
  final Function roleBase;
  final Border? border;

  @override
  State<WhoAreYouCard> createState() => _WhoAreYouCardState();
}

class _WhoAreYouCardState extends State<WhoAreYouCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                widget.roleBase();
                if (kDebugMode) {
                  print("YOOOOO");
                }
              },
              child: Container(
                width: size.width / 3,
                height: size.width / 3,
                decoration: BoxDecoration(
                  border: widget.border,
                  color: themeListener.isDark ? cardColorDark : cardColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: widget.image,
                  color:
                      themeListener.isDark ? mainColorDark : subTitleColorDark,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        Text(
          widget.tilte,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:
                  themeListener.isDark ? titleTextColorDark : titleTextColor),
        ),
      ],
    );
  }
}
