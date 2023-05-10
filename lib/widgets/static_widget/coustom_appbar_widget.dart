import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/auth_provider.dart';
import '../../screens/sub_screens/search_screen.dart';
import '../clikable_widgets/icon_widget.dart';
import '../input_widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';

class CostuomAppBar extends StatefulWidget {
  const CostuomAppBar(
      {super.key,
      required this.profileName,
      required this.isHome,
      required this.title,
      required this.isOtherScreens,
      required this.iconData,
      required this.isDetails,
      required this.subTitle,
      required this.iconBehavior,
      required this.menueFunction});
  final String profileName;
  final bool isHome;
  final String title;
  final String subTitle;
  final bool isOtherScreens;
  final Widget iconData;
  final bool isDetails;
  final Function iconBehavior;
  final Function menueFunction;
  @override
  State<CostuomAppBar> createState() => _CostuomAppBarState();
}

class _CostuomAppBarState extends State<CostuomAppBar> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).loadUsersFromFirestore();
    super.initState();
  }

  final searchController = TextEditingController();
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    bool islanguage = AppLocalizations.of(context)!.localeName == 'ar';
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: widget.isHome
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.menueFunction();
                          },
                          icon: Image.asset(themeListener.isDark
                              ? (islanguage
                                  ? "assets/icons/menue_Drak_ar.png"
                                  : "assets/icons/menu_dark.png")
                              : (islanguage
                                  ? "assets/icons/menue_ar.png"
                                  : "assets/icons/menu.png"))),
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: themeListener.isDark
                                ? titleTextColorDark
                                : titleTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: widget.isOtherScreens
                            ? const SizedBox()
                            : IconButton(
                                color: themeListener.isDark
                                    ? titleTextColorDark
                                    : titleTextColor,
                                icon: widget.iconData,
                                onPressed: () {
                                  widget.iconBehavior();
                                },
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  widget.isOtherScreens
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .homescreenappbar,
                                    style: TextStyle(
                                        color: themeListener.isDark
                                            ? titleTextColorDark
                                            : titleTextColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  widget.profileName,
                                  style: TextStyle(
                                      color: themeListener.isDark
                                          ? titleTextColorDark
                                          : titleTextColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .homescreenappbarsubtitle,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: themeListener.isDark
                                      ? subTitleColorDark
                                      : subTitleColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height / 12,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const SearchScreen()));
                                },
                                child: TextFieldWidget(
                                  isDiscription: false,
                                  isPassword: false,
                                  prefix: Image.asset(themeListener.isDark
                                      ? "assets/icons/serachIcon_Dark.png"
                                      : "assets/icons/serachicon.png"),
                                  textFieldController: searchController,
                                  node: TextInputAction.search,
                                  isVisable: false,
                                  hintTxt: AppLocalizations.of(context)!.search,
                                  keyboardType: TextInputType.visiblePassword,
                                  validtion: (value) {},
                                  obscureText: false,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: widget.isDetails
                          ? const Color.fromARGB(120, 255, 255, 255)
                          : Colors.transparent,
                      child: IconButton(
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor,
                        icon: widget.iconData,
                        onPressed: () {
                          widget.iconBehavior();
                        },
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: widget.isDetails
                                ? (themeListener.isDark
                                    ? titleTextColor
                                    : Colors.white)
                                : (themeListener.isDark
                                    ? titleTextColorDark
                                    : Colors.black),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      widget.isDetails
                          ? Text(
                              widget.subTitle,
                              style: TextStyle(
                                  color: subTitleColorDark,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          : const SizedBox()
                    ],
                  ),
                  widget.isDetails
                      ? IconWidget(
                          icon: isFav ? Icons.favorite : Icons.favorite_border,
                          isAppbar: true,
                          isFave: isFav,
                          isSize: size.width / 15,
                          onClick: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                        )
                      : const SizedBox(),
                ],
              ));
  }
}
