import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:flutter/material.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewsLanguageCard extends StatefulWidget {
  const ViewsLanguageCard(
      {super.key,
      required this.iconFlag,
      required this.titleLang,
      required this.languageSetter,
      required this.value});
  final String iconFlag;
  final String titleLang;
  final Function languageSetter;
  final bool value;
  @override
  State<ViewsLanguageCard> createState() => _ViewsLanguageCardState();
}

class _ViewsLanguageCardState extends State<ViewsLanguageCard> {
  bool language = true;
  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('language', language);
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      language = prefs.getBool('language') ?? false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.iconFlag,
                    width: size.width / 8,
                  ),
                  SizedBox(
                    width: size.width / 15,
                  ),
                  Text(
                    widget.titleLang,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor),
                  ),
                ],
              ),
              Checkbox(
                  value: widget.value,
                  onChanged: (language) {
                    setState(() {
                      widget.languageSetter();
                      saveData();
                    });
                  },
                  checkColor: Colors.white,
                  activeColor: themeListener.isDark ? mainColorDark : mainColor,
                  fillColor: MaterialStateProperty.all(
                    themeListener.isDark ? mainColorDark : mainColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
