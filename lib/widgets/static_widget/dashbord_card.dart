import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import '../../helpers/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard(
      {super.key,
      required this.image,
      required this.catagory,
      required this.discription,
      required this.price,
      required this.editFunction,
      required this.deleteFunction});
  final String image;
  final String catagory;
  final String discription;
  final Function editFunction;
  final Function deleteFunction;
  final String price;
  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      width: size.width / 2,
      height: size.width / 2,
      decoration: BoxDecoration(
          border: Border.all(
              color: themeListener.isDark
                  ? subTitleColorDark.withOpacity(0.5)
                  : subTitleColor.withOpacity(0.5)),
          color: themeListener.isDark ? cardColorDark : cardColor,
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  fit: BoxFit.cover,
                  widget.image,
                  width: size.width / 3.5,
                  height: size.width / 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.catagory,
                    style: TextStyle(
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height / 100,
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(
                      color: themeListener.isDark ? successDark : success,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 100,
                  ),
                  SizedBox(
                      width: size.width / 2,
                      child: Text(
                        widget.discription,
                        style: TextStyle(
                          color: themeListener.isDark
                              ? subTitleColorDark
                              : subTitleColor,
                          fontSize: 15,
                        ),
                      )),
                ],
              ),
            ),
          ]),
          Positioned(
            left: AppLocalizations.of(context)!.localeName == 'ar' ? 10 : 250,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      widget.editFunction();
                    },
                    icon: Icon(
                      Icons.edit_square,
                      size: 30,
                      color: themeListener.isDark
                          ? subTitleColorDark.withOpacity(0.8)
                          : subTitleColor.withOpacity(0.8),
                    )),
                IconButton(
                    onPressed: () {
                      widget.deleteFunction();
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: themeListener.isDark
                          ? subTitleColorDark.withOpacity(0.8)
                          : subTitleColor.withOpacity(0.8),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
