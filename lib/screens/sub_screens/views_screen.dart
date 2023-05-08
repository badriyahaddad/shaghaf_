import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';
import '../../widgets/static_widget/coustom_appbar_widget.dart';
import '../../widgets/static_widget/views_language_card.dart';

class ViewsScreen extends StatefulWidget {
  const ViewsScreen({super.key});

  @override
  State<ViewsScreen> createState() => _ViewsScreenState();
}

class _ViewsScreenState extends State<ViewsScreen> {
  bool language = true;

  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    final themeFunction = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 70,
          ),
          CostuomAppBar(
            menueFunction: () {},
            isDetails: false,
            isHome: false,
            profileName: '',
            title: AppLocalizations.of(context)!.views,
            isOtherScreens: false,
            iconBehavior: () {
              Navigator.pop(context);
            },
            iconData: const Icon(Icons.arrow_back),
            subTitle: '',
          ),
          SizedBox(
            height: size.height / 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              AppLocalizations.of(context)!.lanuagepickertext,
              style: TextStyle(
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 30,
              ),
              ViewsLanguageCard(
                iconFlag: "assets/icons/arabic.png",
                titleLang: AppLocalizations.of(context)!.languagearabic,
                languageSetter: () {
                  MyApp.setLocale(context, const Locale('ar'));
                },
                value: AppLocalizations.of(context)!.localeName == 'ar',
              ),
              SizedBox(
                height: size.height / 30,
              ),
              ViewsLanguageCard(
                iconFlag: "assets/icons/english.png",
                titleLang: AppLocalizations.of(context)!.languageenglish,
                languageSetter: () {
                  MyApp.setLocale(context, const Locale('en'));
                },
                value: AppLocalizations.of(context)!.localeName == 'en',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Divider(
                  color:
                      themeListener.isDark ? subTitleColorDark : subTitleColor,
                  thickness: 1,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  AppLocalizations.of(context)!.mode,
                  style: TextStyle(
                      color: themeListener.isDark
                          ? titleTextColorDark
                          : titleTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SwitchListTile.adaptive(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    themeFunction.isDark
                        ? AppLocalizations.of(context)!.darkmode
                        : AppLocalizations.of(context)!.lightmode,
                    style: TextStyle(
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                activeThumbImage: themeListener.isDark
                    ? const AssetImage("assets/icons/moon.png")
                    : const AssetImage("assets/icons/sun.png"),
                inactiveThumbImage: themeListener.isDark
                    ? const AssetImage("assets/icons/moon.png")
                    : const AssetImage("assets/icons/sun.png"),
                activeTrackColor:
                    themeListener.isDark ? cardColorDark : cardColor,
                activeColor: themeListener.isDark
                    ? backgroundColorDark
                    : backgroundColor,
                value: themeListener.isDark,
                onChanged: (bool value) {
                  setState(() {
                    themeFunction.switchMode();
                  });
                },
              ),
            ],
          )
        ],
      ))),
    );
  }
}
