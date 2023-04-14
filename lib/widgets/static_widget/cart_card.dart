import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';

class CartCard extends StatefulWidget {
  const CartCard(
      {super.key,
      required this.productImage,
      required this.producTitle,
      required this.productSubTitle,
      required this.productPrice,
      this.iconBehavior,
      required this.noOfDoublecated});
  final String productImage;
  final String producTitle;
  final String productSubTitle;
  final String productPrice;
  final Function? iconBehavior;
  final int noOfDoublecated;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: size.width / 5,
          height: size.width / 3,
          decoration: BoxDecoration(
              color: themeListener.isDark ? cardColorDark : cardColor,
              borderRadius: BorderRadius.circular(16)),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Positioned(
                top: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.productImage,
                    width: size.width / 5,
                    height: size.width / 5,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                right:
                    AppLocalizations.of(context)!.localeName == 'ar' ? 100 : 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.producTitle,
                      style: TextStyle(
                          color: themeListener.isDark
                              ? titleTextColorDark
                              : titleTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.productSubTitle,
                      style: TextStyle(
                        color: themeListener.isDark
                            ? subTitleColorDark
                            : subTitleColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      " ${widget.productPrice}",
                      style: TextStyle(
                        color: themeListener.isDark ? successDark : success,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left:
                    AppLocalizations.of(context)!.localeName == 'ar' ? 10 : 100,
                child: CircleAvatar(
                  backgroundColor: themeListener.isDark
                      ? backgroundColorDark
                      : backgroundColor,
                  child: Text(
                    "${widget.noOfDoublecated}",
                    style: TextStyle(
                      color: themeListener.isDark
                          ? titleTextColorDark
                          : titleTextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: AppLocalizations.of(context)!.localeName == 'ar'
                      ? 10
                      : 100,
                  child: Row(
                    children: [
                      Container(
                          width: size.width / 15,
                          height: size.width / 15,
                          decoration: BoxDecoration(
                              color: themeListener.isDark
                                  ? subTitleColor.withOpacity(0.5)
                                  : subTitleColorDark.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.add)),
                      SizedBox(
                        width: size.width / 50,
                      ),
                      Container(
                          width: size.width / 10,
                          height: size.width / 15,
                          decoration: BoxDecoration(
                              color: themeListener.isDark
                                  ? backgroundColorDark
                                  : backgroundColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            child: Text(
                              " ${widget.productPrice}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          )),
                      SizedBox(
                        width: size.width / 50,
                      ),
                      Container(
                          width: size.width / 15,
                          height: size.width / 15,
                          decoration: BoxDecoration(
                              color: themeListener.isDark
                                  ? subTitleColor.withOpacity(0.5)
                                  : subTitleColorDark.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.remove)),
                    ],
                  ))
            ],
          )),
    );
  }
}
