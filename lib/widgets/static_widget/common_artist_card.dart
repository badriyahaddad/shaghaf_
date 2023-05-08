import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/helpers/const.dart';
import 'package:shaghaf/providers/theme_provider.dart';

class CommonArtistCard extends StatefulWidget {
  const CommonArtistCard(
      {super.key,
      required this.artistName,
      required this.catagory,
      required this.artistPic});
  final String artistName;

  final String catagory;
  final String artistPic;
  @override
  State<CommonArtistCard> createState() => _CommonArtistCardState();
}

class _CommonArtistCardState extends State<CommonArtistCard> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery for more responsive UI
    Size size = MediaQuery.of(context).size;
    //dark theme mode to listen to the changes when the mode it's changes
    final themeListener = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      width: size.width / 10,
      height: size.width / 10,
      decoration: BoxDecoration(
          color: themeListener.isDark ? cardColorDark : cardColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SizedBox(
            height: size.width / 60,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.network(
              widget.artistPic,
              width: size.width / 4,
            ),
          ),
          SizedBox(
            height: size.width / 100,
          ),
          Text(
            widget.artistName,
            style: TextStyle(
                color:
                    themeListener.isDark ? titleTextColorDark : titleTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            widget.catagory,
            style: TextStyle(
                color: themeListener.isDark ? subTitleColorDark : subTitleColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
