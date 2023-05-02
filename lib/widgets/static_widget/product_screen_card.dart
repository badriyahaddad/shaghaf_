import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/providers/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';

class ProductScreenCard extends StatefulWidget {
  const ProductScreenCard(
      {super.key,
      required this.productImage,
      required this.producTitle,
      required this.productSubTitle,
      required this.productPrice,
      this.iconBehavior});
  final String productImage;
  final String producTitle;
  final String productSubTitle;
  final String productPrice;
  final Function? iconBehavior;
  @override
  State<ProductScreenCard> createState() => _ProductScreenCardState();
}

class _ProductScreenCardState extends State<ProductScreenCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      width: size.width / 8,
      height: size.width / 8,
      decoration: BoxDecoration(
          color: themeListener.isDark ? cardColorDark : cardColor,
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.width / 60,
              ),
              Image.network(
                widget.productImage,
                width: size.width / 7,
              ),
              SizedBox(
                height: size.width / 100,
              ),
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
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Positioned(
            top: 10,
            left: AppLocalizations.of(context)!.localeName == 'ar' ? 6 : 13,
            child: CircleAvatar(
              backgroundColor: themeListener.isDark
                  ? secondrayColorDark.withOpacity(0.7)
                  : secondrayColor.withOpacity(0.7),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.add),
                onPressed: () {
                  widget.iconBehavior!();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
