import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/const.dart';
import '../../providers/theme_provider.dart';

class HistroyBookingCard extends StatefulWidget {
  const HistroyBookingCard(
      {super.key,
      required this.catagory,
      required this.nameArtist,
      required this.price,
      required this.image,
      required this.headlineTitle});
  final String catagory;
  final String nameArtist;
  final String price;
  final String headlineTitle;
  final String image;
  @override
  State<HistroyBookingCard> createState() => _HistroyBookingCardState();
}

class _HistroyBookingCardState extends State<HistroyBookingCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      width: size.width / 3,
      height: size.width / 3,
      decoration: BoxDecoration(
          border: Border.all(
              color: themeListener.isDark
                  ? subTitleColorDark.withOpacity(0.5)
                  : subTitleColor.withOpacity(0.5)),
          color: themeListener.isDark ? cardColorDark : cardColor,
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    fit: BoxFit.cover,
                    widget.image,
                    width: size.width / 4.5,
                    height: size.width / 3,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Text(
                    widget.headlineTitle,
                    style: TextStyle(
                      color: themeListener.isDark
                          ? subTitleColorDark
                          : subTitleColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.nameArtist,
                    style: TextStyle(
                        color: themeListener.isDark
                            ? titleTextColorDark
                            : titleTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.catagory,
                    style: TextStyle(
                      color: themeListener.isDark
                          ? subTitleColorDark
                          : subTitleColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.price,
              style: TextStyle(
                  color: themeListener.isDark
                      ? titleTextColorDark
                      : titleTextColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
